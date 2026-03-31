sealed class BaseState {}

class Initial extends BaseState {
}

class Loading extends BaseState {}

class Success extends BaseState {
  final dynamic data;
  Success(this.data);
}

class Failure extends BaseState {
  final String error;
  Failure(this.error);
}
