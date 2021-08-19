import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => <Object>[message];
}

// General Failures
class ServerFailure extends Failure {
  const ServerFailure({message}) : super(message: message);

  @override
  List<Object?> get props => List.empty();
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({message}) : super(message: message);

  @override
  List<Object?> get props => List.empty();
}

// Sign in failures
class SignInFailure extends Failure {
  const SignInFailure({message}) : super(message: message);

  @override
  List<Object?> get props => <Object>[message];
}
