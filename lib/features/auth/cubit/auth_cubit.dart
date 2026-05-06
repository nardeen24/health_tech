import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tech/features/auth/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(LoginInitialState());
  

}