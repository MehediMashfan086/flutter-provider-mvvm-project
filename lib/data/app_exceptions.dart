class AppException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  AppException([
    this._message,
    this._prefix,
  ]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication!");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request!");
}

class UnAuthorisedException extends AppException {
  UnAuthorisedException([String? message])
      : super(message, "UnAuthorised Request!");
}

class InvaliInputException extends AppException {
  InvaliInputException([String? message]) : super(message, "Invalid Input!");
}
