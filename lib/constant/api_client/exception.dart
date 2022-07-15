class GeneralException implements Exception {
  final dynamic message;

  GeneralException({this.message}) : super();
}

class NetworkException implements Exception {
  final dynamic message;

  NetworkException({this.message = 'Check you internet connection.'}) : super();
}

class BadRequestException implements Exception {}

class UnauthorisedException implements Exception {}

class FetchDataException implements Exception {}

class Forbidden implements Exception {}

class NotFound implements Exception {}

class UnprocessableEntity implements Exception {}

class InternalServerError implements Exception {}
