import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:takesavenue/core/routes.gr.dart';
import 'package:takesavenue/features/auth/cubits/auth_state.dart';
import 'package:takesavenue/features/auth/repository/auth_repository.dart';
import 'package:takesavenue/models/user.dart' as user_model;
import 'package:takesavenue/utils/widgets/show_message.dart';

class AuthCubits extends Cubit<AuthState> {
  AuthCubits() : super(AuthState());

  var firebaseAuth = FirebaseAuth.instance;
  var authRepository = AuthRepository();

  void signIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      var credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await authRepository.getUserRecord(id: credential.user!.uid);
      context.router.replaceAll([HomeRoute()]);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      showMessage(context, e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  void signUp(
    BuildContext context, {
    required String email,
    required String password,
    required String username,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      // Call the API
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        // save credential to backend with username
        // var verificationId = await credential.user!.getIdToken();

         user_model.User user = await authRepository.createUserRecord(
          user: user_model.User(
            id: credential.user!.uid,
            email: email,
            username: username,
          ),
        );

        emit(state.copyWith(user: user));

        context.router.replaceAll([HomeRoute()]);
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      showMessage(context, e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  void signInWithGoogle(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Call the API to store user details
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      showMessage(context, e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  void signOut(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      showMessage(context, e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  void forgotPassword(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      String email = firebaseAuth.currentUser!.email!;
      await firebaseAuth.sendPasswordResetEmail(email: email);
      showAboutDialog(
        context: context,
        children: [Text('Password reset email has been sent to $email')],
      );
      context.router.pop();
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      showMessage(context, e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }
}
