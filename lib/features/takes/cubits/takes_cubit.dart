import 'dart:async';
import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takesavenue/features/takes/cubits/takes_state.dart';
import 'package:takesavenue/features/takes/repository/take_repository.dart';
import 'package:takesavenue/gen/env.dart';
import 'package:takesavenue/utils/models/user.dart' as user_model;
import 'package:takesavenue/utils/models/take.dart';
import 'package:takesavenue/utils/widgets/show_message.dart';

class TakesCubit extends Cubit<TakesState> {
  TakesCubit() : super(const TakesState());

  TakeRepository _takeRepository = TakeRepository();

  final cloudinary = Cloudinary.unsignedConfig(
    cloudName: Env.cloudinaryCloudName,
  );

  void fetchFeed(BuildContext context) async {
    emit(state.copyWith(isLoadingFeed: true));
    // Fetch takes from API
    try {
      List<Take> feedTakes =
          await _takeRepository.getFeedTakes(); //TODO pass paging later
      emit(state.copyWith(userTakes: feedTakes));
      print("Feed takes");
      print(feedTakes);
    } catch (e) {
      print(e);
      showMessage(context, e.toString());
    }
    emit(state.copyWith(isLoadingFeed: false));
  }

  void fetchUserTakes(BuildContext context) async {
    emit(state.copyWith(isLoadingUserTake: true));
    // Fetch takes from API
    try {
      List<Take> userTakes = await _takeRepository.getUserTakes(
        FirebaseAuth.instance.currentUser!.uid,
      );
      emit(state.copyWith(userTakes: userTakes));
    } catch (e) {
      print(e);
      showMessage(context, e.toString());
    }
    emit(state.copyWith(isLoadingUserTake: false));
  }

  void fetchLeaderboard(BuildContext context) async {
    emit(state.copyWith(isLoadingUserTake: true));
    // Fetch takes from API
    try {
      List<user_model.User> leaderboard = await _takeRepository.fetchLeaderboard(
      );
      emit(state.copyWith(leaderboard: leaderboard));
    } catch (e) {
      print(e);
      showMessage(context, e.toString());
    }
    emit(state.copyWith(isLoadingUserTake: false));
  }

  void addTake(
    BuildContext context, {
    required String title,
    required String responder,
    required String contenttype,
    required String punishment,
    required String content,
    required int duration,
    required Function onComplete,
  }) async {
    // Add take to API
    emit(state.copyWith(isLoading: true));

    try {
      if (contenttype == 'video' || contenttype == 'image') {
        // Upload file to storage
        // get url and set it to content
        String url = await _uploadFileToCloudinary(File(content));
        content = url;
      }

      Duration durationInDays = Duration(days: duration);
      await _takeRepository.saveTake(
        userId: FirebaseAuth.instance.currentUser!.uid,
        responder: responder,
        title: title,
        contenttype: contenttype,
        punishment: punishment,
        content: content,
        duration: durationInDays.inMilliseconds,
      );
      showMessage(context, 'Take added successfully');

      onComplete();
    } catch (e) {
      print(e);
      showMessage(context, e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<String> _uploadFileToCloudinary(File file) async {
    final response = await cloudinary.unsignedUpload(
      file: file.path,
      uploadPreset: Env.cloudinaryPreset,
      fileBytes: file.readAsBytesSync(),
      resourceType: CloudinaryResourceType.auto,
      fileName: file.path.split('/').last, //get filename
      progressCallback: (count, total) {
        print('Uploading image from file with progress: $count/$total');
      },
    );

    if (response.isSuccessful) {
      print('Get your image from with ${response.secureUrl}');
      return response.secureUrl.toString();
    }
    return "";
  }
}
