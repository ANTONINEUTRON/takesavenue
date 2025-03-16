import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takesavenue/features/takes/cubits/takes_state.dart';
import 'package:takesavenue/features/takes/repository/take_repository.dart';
import 'package:takesavenue/utils/widgets/show_message.dart';

class TakesCubit extends Cubit<TakesState> {
  TakesCubit() : super(const TakesState());

  TakeRepository _takeRepository = TakeRepository();

  void fetchTakes() {
    // Fetch takes from API
    emit(state.copyWith());
  }

  void addTake(
    BuildContext context, {
    required String title,
    required String responder,
    required String contenttype,
    required String punishment,
    required String content,
    required int duration,
    required Function() onCompleted,
  }) async {
    // Add take to API
    print('Title: $title');
    print('Content Type: $contenttype');
    print('Punishment: $punishment');
    print('Content: $content');
    print('Duration: $duration');
    emit(state.copyWith(isLoading: true));

    try {
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
      onCompleted();
      showMessage(context, 'Take added successfully');
    } catch (e) {
      print(e);
      showMessage(context, e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  void deleteTake() {
    // Delete take from API
    emit(state.copyWith());
  }
}
