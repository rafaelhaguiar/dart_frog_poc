import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final request = context.request.method.name;
  return Response(body: 'método: $request');
}
