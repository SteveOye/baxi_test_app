import 'dart:convert';
import 'dart:developer';

import 'package:baxi_app/constant/api_client/api_constant.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import 'exception.dart';

class ApiClient {
  final Client _client;

  ApiClient({Client? client}) : _client = client ?? Client();

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    await dotenv.load();
    await Future.delayed(const Duration(milliseconds: 500));
    final response = await _client.get(
      getPath(path, params),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '${dotenv.env['API-KEY']}',
      },
    );
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 201:
        return json.decode(response.body);
      case 400:
        throw BadRequestException();
      case 401:
        throw UnauthorisedException();
      case 403:
        throw Forbidden();
      case 404:
        throw NotFound();
      case 422:
        throw UnprocessableEntity();
      case 500:
        throw InternalServerError();
      default:
        throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path,
      {Map<String, dynamic>? params, String? token}) async {
    await dotenv.load();
    final response = await _client.post(
      getPath(path, null),
      body: json.encode(params),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '${dotenv.env['API-KEY']}',
      },
    );
    log(response.body);
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 201:
        return json.decode(response.body);
      case 400:
        throw BadRequestException();
      case 401:
        throw UnauthorisedException();
      case 403:
        throw Forbidden();
      case 404:
        throw NotFound();
      case 422:
        throw UnprocessableEntity();
      case 500:
        throw InternalServerError();
      default:
        throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, Map<dynamic, dynamic>? params) {
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {});
    }

    return Uri.parse('${ApiConstants.baseUrlDemo}/$path');
  }
}
