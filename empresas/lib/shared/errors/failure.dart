import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({required this.message});

  @override
  List<Object?> get props => <Object>[message];
}

// General Failures
class ServerFailure extends Failure {
  ServerFailure({message}) : super(message: message);

  @override
  List<Object?> get props => List.empty();
}

class ConnectionFailure extends Failure {
  ConnectionFailure({message}) : super(message: message);

  @override
  List<Object?> get props => List.empty();
}

// Sign in failures
class SignInFailure extends Failure {
  SignInFailure({message}) : super(message: message);

  @override
  List<Object?> get props => <Object>[message];
}
