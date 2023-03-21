import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../../app/models/user_model.dart';

Handler middleware(Handler handler) {
  return (context) async {
    try {
      if (context.request.method.name == 'post') {
        final data = await context.request.body();
        UserModel.fromJson(data);
        return handler(context);
      }
      if (context.request.method.name == 'get') {
        if (context.request.uri.queryParameters.containsKey('email')) {
          return handler(context);
        }
        return Response(statusCode: HttpStatus.badRequest, body: 'vacilão');
      }
    } catch (e) {
      return Response(statusCode: HttpStatus.badRequest, body: 'vacilão');
    }

    return Response(statusCode: HttpStatus.methodNotAllowed, body: 'vacilão');
  };
}
