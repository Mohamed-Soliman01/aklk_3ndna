import 'package:aklk_3ndna/core/models/user_model.dart';
import 'package:aklk_3ndna/features/auth/cubit/auth_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
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
      // await addUserProfile();
      // await verifyEmail();
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      _signUpHandleException(e);
    } catch (e) {
      emit(SignupFailureState(errMessage: e.toString()));
    }
  }

  void _signUpHandleException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(SignupFailureState(errMessage: 'The password provided is too weak'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignupFailureState(
          errMessage: 'The account already exists for that email.'));
    } else if (e.code == 'invalid-email') {
      emit(SignupFailureState(errMessage: 'The email is invalid.'));
    } else {
      emit(SignupFailureState(errMessage: e.code));
    }
  }

  // Register User

  // void userRegister({
  //   required String email,
  //   required String password,
  //   required String name,
  //   required String phone,
  // }) {
  //   FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   )
  //       .then((value) {
  //     //emit(RegisterUserLoadingState());
  //     print(value.user!.email);
  //     print(value.user!.uid);
  //     userCreate(
  //       email: email,
  //       name: name,
  //       phone: phone,
  //       uid: value.user!.uid,
  //     );
  //   }).catchError((error) {
  //     _signUpHandleException(error);
  //   });
  // }

  void userCreate({
    String? email,
    required String name,
    required String phone,
    String? uid,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uid: uid,
      image:
          'https://image.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error));
    });
  }

// Login User

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginInUserLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print('Email => ${value.user!.email}');
      print('Id => ${value.user!.uid}');

      emit(LoginInUserSuccessState(value.user!.uid));
    }).catchError((onError) {
      emit(LoginInUserErrorState(onError.toString()));
    });
  }

  // obscure Password Text
  bool? obscurePasswordTextValue = true;
  // GlobalKey<FormState> signupFormKey = GlobalKey();

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  bool? termsAndConditionCheckBoxValue = false;

  void updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }
}
