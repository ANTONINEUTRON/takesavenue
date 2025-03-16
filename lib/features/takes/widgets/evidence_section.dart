import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

enum EvidenceType { text, image, video }

class EvidenceSection extends StatefulWidget {
  final Function(String) onTextChanged;
  final Function(File) onImageSelected;
  final Function(File) onVideoSelected;
  final VideoPlayerController? videoController;

  const EvidenceSection({
    super.key,
    required this.onTextChanged,
    required this.onImageSelected,
    required this.onVideoSelected,
    this.videoController,
  });

  @override
  State<EvidenceSection> createState() => _EvidenceSectionState();
}

class _EvidenceSectionState extends State<EvidenceSection> {
  EvidenceType _selectedType = EvidenceType.video;
  final _textController = TextEditingController();
  File? _selectedImage;
  File? _selectedVideo;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take Photo'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Choose from Gallery'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  void _showVideoSourceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.videocam),
            title: const Text('Record Video'),
            onTap: () {
              Navigator.pop(context);
              _pickVideo(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_library),
            title: const Text('Choose from Gallery'),
            onTap: () {
              Navigator.pop(context);
              _pickVideo(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
        widget.onImageSelected(_selectedImage!);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _pickVideo(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickVideo(
        source: source,
        maxDuration: const Duration(minutes: 1),
      );
      if (pickedFile != null) {
        setState(() {
          _selectedVideo = File(pickedFile.path);
        });
        widget.onVideoSelected(_selectedVideo!);
      }
    } catch (e) {
      print('Error picking video: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Evidence',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SegmentedButton<EvidenceType>(
          segments: const [
            ButtonSegment(
              value: EvidenceType.video,
              icon: Icon(Icons.videocam),
              label: Text('Video'),
            ),
            ButtonSegment(
              value: EvidenceType.text,
              icon: Icon(Icons.text_fields),
              label: Text('Text'),
            ),
            ButtonSegment(
              value: EvidenceType.image,
              icon: Icon(Icons.image),
              label: Text('Image'),
            ),
          ],
          selected: {_selectedType},
          onSelectionChanged: (Set<EvidenceType> newSelection) {
            setState(() {
              _selectedType = newSelection.first;
            });
          },
        ),
        const SizedBox(height: 16),
        _buildEvidenceInput(),
      ],
    );
  }

  Widget _buildEvidenceInput() {
    switch (_selectedType) {
      case EvidenceType.text:
        return TextField(
          controller: _textController,
          maxLines: 3,
          onChanged: widget.onTextChanged,
          decoration: InputDecoration(
            hintText: 'Describe your evidence...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      case EvidenceType.image:
        return _selectedImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  _selectedImage!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            : _buildMediaPicker(
                icon: Icons.add_photo_alternate,
                onTap: _showImageSourceOptions,
              );
      case EvidenceType.video:
        return _selectedVideo != null && widget.videoController != null
            ? AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(widget.videoController!),
              )
            : _buildMediaPicker(
                icon: Icons.videocam,
                onTap: _showVideoSourceOptions,
              );
    }
  }

  Widget _buildMediaPicker({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, size: 50),
        onPressed: onTap,
      ),
    );
  }
}