// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'login_state.g.dart';

@match
enum LoginStatus { initial, login, success, loginError, error }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMesssage;

  const LoginState({
    required this.status,
    this.errorMesssage,
  });

  const LoginState.initial()
      : status = LoginStatus.initial,
        errorMesssage = null;

  @override
  List<Object?> get props => [status, errorMesssage];

  LoginState copyWith({
    LoginStatus? status,
    String? errorMesssage,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMesssage: errorMesssage ?? this.errorMesssage,
    );
  }
}
