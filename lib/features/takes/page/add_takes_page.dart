import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takesavenue/features/takes/cubits/takes_cubit.dart';
import 'package:takesavenue/features/takes/widgets/evidence_section.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class AddBanterPage extends StatefulWidget {
  const AddBanterPage({super.key});

  @override
  _AddBanterPageState createState() => _AddBanterPageState();
}

class _AddBanterPageState extends State<AddBanterPage> {
  final _formKey = GlobalKey<FormState>();
  final _takeController = TextEditingController();
  final _challengeUserController = TextEditingController();
  final _punishmentController = TextEditingController();
  int _selectedDuration = 1;
  bool _isLoading = false;
  String _selectedEvidenceType = 'text';
  File? _selectedImage;
  File? _selectedVideo;
  VideoPlayerController? _videoController;
  String _evidenceText = '';

  bool _validateInputs() {
    if (_takeController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your take')));
      return false;
    }

    if (_challengeUserController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter challenger username')),
      );
      return false;
    }

    if (_punishmentController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter punishment')));
      return false;
    }

    if (_selectedVideo == null &&
        _selectedImage == null &&
        _evidenceText.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please provide evidence')));
      return false;
    }

    return true;
  }

  void _submitTake() async {
    if (!_validateInputs()) return;

    setState(() => _isLoading = true);

    try {
      context.read<TakesCubit>().addTake(
        context,
        title: _takeController.text,
        responder: _challengeUserController.text,
        punishment: _punishmentController.text,
        duration: _selectedDuration,
        contenttype: _getEvidenceType().name,
        content:
            _evidenceText.isNotEmpty
                ? _evidenceText
                : _selectedImage?.path ?? _selectedVideo?.path ?? '',
        onCompleted: () {
          // reset form
          _takeController.clear();
          _challengeUserController.clear();
          _punishmentController.clear();
          _selectedDuration = 1;
          _selectedImage = null;
          _selectedVideo = null;
          _videoController?.dispose();
          _videoController = null;
          _evidenceText = '';
        },
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  EvidenceType _getEvidenceType() {
    if (_selectedVideo != null) return EvidenceType.video;
    if (_selectedImage != null) return EvidenceType.image;
    if (_evidenceText.isNotEmpty) return EvidenceType.text;
    return EvidenceType.text;
  }

  @override
  void dispose() {
    _takeController.dispose();
    _challengeUserController.dispose();
    _punishmentController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Take')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Your Take',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _takeController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Enter your take...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Dynamic Evidence Input
          EvidenceSection(
            videoController: _videoController,
            onTextChanged: (text) {
              // Handle text evidence
              _evidenceText = text;
              _selectedImage = null;
              _selectedVideo = null;
            },
            onImageSelected: (file) {
              // Handle image evidence

              setState(() {
                _evidenceText = "";
                _selectedImage = file;
                _selectedVideo = null;
              });
            },
            onVideoSelected: (file) {
              setState(() {
                _evidenceText = "";
                _selectedImage = null;
                _selectedVideo = file;
                _videoController = VideoPlayerController.file(file)
                  ..initialize().then((_) {
                    setState(() {});
                  });
              });
            },
          ),

          const SizedBox(height: 24),

          const Text(
            'Responder',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _challengeUserController, // Add controller to state
            decoration: InputDecoration(
              hintText: 'Enter username or email',
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              helperText: 'The person who needs to respond to your take',
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Punishment',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _punishmentController,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: 'Enter punishment for losing...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            'Duration',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<int>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items:
                List.generate(7, (index) => index + 1)
                    .map(
                      (day) => DropdownMenuItem(
                        value: day,
                        child: Text('$day ${day == 1 ? "day" : "days"}'),
                      ),
                    )
                    .toList(),
            onChanged: (value) {
              setState(() {

                _selectedDuration = value!;
              });
            },
            hint: const Text('Select duration'),
          ),

          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _submitTake,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child:
                  _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Create Take'),
            ),
          ),
        ],
      ),
    );
  }
}
