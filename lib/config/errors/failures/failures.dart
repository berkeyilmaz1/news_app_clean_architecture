/// Failures are errors that can occur in the application.
/// They are used to handle errors in the application.
/// Each failure has an error message that describes the error that occurred.
sealed class Failure {
  Failure({required this.errorMessage});

  final String errorMessage;
}

final class NetworkFailure extends Failure {
  NetworkFailure({required super.errorMessage});
}

final class UnknownFailure extends Failure {
  UnknownFailure({required super.errorMessage});
}
