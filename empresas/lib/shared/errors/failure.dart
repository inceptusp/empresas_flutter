import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// General Failures
class ServerFailure extends Failure {
  @override
  List<Object?> get props => List.empty();
}
