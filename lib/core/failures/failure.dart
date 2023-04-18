abstract class Failure {
  final String message;

  Failure({required this.message});
}

class UnhandledFailure extends Failure {
  UnhandledFailure({required super.message});
}

class InvalidCredentialsFailure extends Failure {
  InvalidCredentialsFailure() : super(message: 'Invalid Credentials');
}

class InvalidUserFailure extends Failure {
  InvalidUserFailure() : super(message: 'invalid User');
}

class InvalidUserIdFailure extends Failure {
  InvalidUserIdFailure() : super(message: 'Invalid User id');
}

class InvalidClubFailure extends Failure {
  InvalidClubFailure() : super(message: 'Invalid Club');
}
