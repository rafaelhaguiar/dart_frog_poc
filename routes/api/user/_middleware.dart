import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return (context) async {
    if (context.request.method.name == 'post') {
      final keys = jsonDecode(await context.request.body()) as Map;
      if (keys.containsKey('email') &&
          keys.containsKey('name') &&
          keys.containsKey('password')) {
        return handler(context);
      }

      return Response(statusCode: HttpStatus.badRequest, body: keys.toString());
    }
    return handler(context);
  };
}
     //if (keys.containsKey('email') &&
     //    keys.containsKey('name') &&
     //    keys.containsKey('password')) {
     //  return handler(context);
     //}