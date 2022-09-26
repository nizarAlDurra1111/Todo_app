part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {

  @override
  List<Object> get props => [];
  int? userId;
  String? name;
  String? token;
  AuthStatus? authStatus = AuthStatus.guest;

  AuthenticationState({this.userId, this.name, this.token,this.authStatus});

  AuthenticationState copyWith({
    int? userId,
    String? name,
    String? token,
    AuthStatus? authStatus,
  }) {
    return AuthenticationState(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        token: token ?? this.token,
        authStatus: authStatus ?? this.authStatus
    );
  }

}

enum AuthStatus{
  guest,
  auth,
}
