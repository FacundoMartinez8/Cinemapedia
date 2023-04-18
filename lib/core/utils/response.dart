import 'package:cinemapedia/core/utils/entity.dart';

abstract class Response extends Entity {
  final int code;
  final String message;
  final String response;
  final bool status;

  Response({
    required this.code,
    required this.message,
    required this.response,
    required this.status,
  });
}
