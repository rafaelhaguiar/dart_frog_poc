import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final request = context.request;
  final params = request.uri.queryParameters;
  return params.containsKey('id')
      ? Response(body: 'id = ${params['id']}')
      : Response(body: 'id not found', statusCode: 400);
}
