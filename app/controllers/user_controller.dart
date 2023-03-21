import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../dao/user_dao.dart';
import '../models/user_model.dart';

class UserController {
  static Future<Response> insertUser(Request request) async {
    try {
      final data = await request.body();
      final user = UserModel.fromJson(data);
      final result = await UserDAO.insertUser(user);
      return Response(body: result.toJson());
    } catch (e) {
      return Response(statusCode: HttpStatus.conflict, body: e.toString());
    }
  }

  static Future<Response> getUser(Request request) async {
    try {
      final email = request.uri.queryParameters['email'] ?? '';
      final result = await UserDAO.getUser(email);

      if (result == null) {
        return Response();
      }

      return Response(body: result.toJson());
    } catch (e) {
      return Response(statusCode: 401);
    }
  }
}
