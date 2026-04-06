abstract class Failure implements Exception {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  final dynamic error;
  const ServerFailure(super.message, {this.error});
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ParsingFailure extends Failure {
  const ParsingFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
