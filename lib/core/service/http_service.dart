import 'dart:convert';

import 'package:cinemapedia/core/utils/entity.dart';
import 'package:http/http.dart' as http;

abstract class HttpServiceBase {
  Future<Map> get({required String url});
  Future<Map> post({required String url, required Entity data});
  Future<Map> getById({required String url, required int id});
}

class HttpService extends HttpServiceBase {
  @override
  Future<Map> get({required String url, Map<String, String>? headers}) async {
    var result = await http.get(Uri.parse(url), headers: headers);
    return jsonDecode(result.body);
  }

  @override
  Future<Map> post({required String url, required Entity data}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Map> getById({required String url, required int id}) {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
