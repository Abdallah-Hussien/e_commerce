part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = LoginLoading;
  factory LoginState.success(dynamic data) = LoginSuccess;
  const factory LoginState.failure(String error) = LoginFailure;
}
