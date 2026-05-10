import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tech/core/data_source/firebase_date_source.dart';
import 'package:health_tech/features/auth/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();
  AuthCubit() : super(LoginInitialState());

  Future<void> signUp(String email, String password, String name) async {
    emit(SignupLoadingState());
    try {
      await firebaseDataSource.signUp(email, password, name);
      print('Signup successful');
      emit(SignupSuccessState('Signup successful'));
    } catch (e) {
      emit(SignupErrorState(e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await firebaseDataSource.login(email, password);
      emit(LoginSuccessState('Login successful'));
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}


