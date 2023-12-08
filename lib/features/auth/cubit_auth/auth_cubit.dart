import 'dart:developer';

import 'package:aklk_3ndna/features/auth/cubit_auth/auth_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

//! SignUp With Email And Password
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      emit(SignupLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await addUserProfile(name: name, email: email, phone: phone);
      await verifyEmail();
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      _signUpHandleException(e);
    } catch (e) {
      emit(SignupFailureState(errMessage: e.toString()));
    }
  }

//! user Create
  Future<void> addUserProfile({
    required String email,
    required String name,
    required String phone,
  }) async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "email": email,
      "name": name,
      "phone": phone,
      "image": 'assets/images/get_started/user.jpg'
    });
  }

//! verify Email
  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

//! SignUp Handle Exception
  void _signUpHandleException(FirebaseAuthException error) {
    if (error.code == 'weak-password') {
      emit(SignupFailureState(errMessage: 'The password provided is too weak'));
    } else if (error.code == 'email-already-in-use') {
      emit(SignupFailureState(
          errMessage: 'The account already exists for that email.'));
    } else if (error.code == 'invalid-email') {
      emit(SignupFailureState(errMessage: 'The email is invalid.'));
    } else if (error.code == 'network-request-failed') {
      emit(SignupFailureState(
          errMessage: 'Please check your network connection.'));
    } else {
      log(error.code);
      emit(SignupFailureState(errMessage: error.code));
    }
  }

//! Login User => SigIn With Email And Password
  Future<void> sigInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(SigninLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SigninSuccessState());
    } on FirebaseAuthException catch (erorr) {
      _signInHandleException(erorr);
    } catch (e) {
      emit(
        SigninFailureState(errMessage: e.toString()),
      );
    }
  }

//! SignIn Handle Exception
  void _signInHandleException(FirebaseAuthException error) {
    if (error.code == 'user-not-found') {
      emit(SigninFailureState(errMessage: 'No user found for that email.'));
    } else if (error.code == 'wrong-password') {
      emit(SigninFailureState(
          errMessage: 'Wrong password provided for that user.'));
    } else {
      emit(SigninFailureState(errMessage: 'Check your Email and password!'));
    }
  }

//! Reset Password With Link
  Future<void> resetPasswordWithLink({required String email}) async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ResetPasswordSuccessState());
    } catch (erorr) {
      emit(ResetPasswordFailureState(errMessage: erorr.toString()));
    }
  }

//! obscure Password Text
  bool obscurePasswordTextValue = true;
  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

//! Update Terms And Condition CheckBox
  bool? termsAndConditionCheckBoxValue = false;
  void updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }
}
