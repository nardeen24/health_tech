import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tech/core/data_source/firebase_date_source.dart';
import 'package:health_tech/features/auth/cubit/auth_states.dart';
import 'package:health_tech/features/auth/models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();
  String? currentUserName;

  AuthCubit() : super(LoginInitialState());

  Future<void> signUp(String email, String password, String name) async {
    emit(SignupLoadingState());
    try {
      await firebaseDataSource.signUp(email, password, name);
      //depugprint

   

      print('Signup successful');
      currentUserName = name;
      emit(SignupSuccessState('Signup successful', currentUserName!));
    } catch (e) {
      emit(SignupErrorState(e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      UserModel user = await firebaseDataSource.login(email, password);

      currentUserName = user.name;

      emit(LoginSuccessState('Login successful', currentUserName!));
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
