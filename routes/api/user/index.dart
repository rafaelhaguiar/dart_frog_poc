import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../../app/controllers/user_controller.dart';

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method.name;
  switch (method) {
    case 'post':
      return UserController.insertUser(context.request);
    case 'get':
      return UserController.getUser(context.request);
    default:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
