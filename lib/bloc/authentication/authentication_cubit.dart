import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState());
  void isLoggedIn() async{
    emit(state.copyWith(authStatus: AuthStatus.guest));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Object? token = preferences.get('token');
    if(token != null){
      print(token);
      emit(state.copyWith(authStatus: AuthStatus.auth));
    }
    return;
  }
}
