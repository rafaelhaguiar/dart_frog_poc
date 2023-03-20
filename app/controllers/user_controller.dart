import 'package:dart_frog/dart_frog.dart';

import '../dao/user_dao.dart';
import '../models/user_model.dart';

class UserController {
  static Future<Response> insertUser(String request) async {
    try {
      final user = UserModel(
        name: 'rafael',
        email: 'rafael@rhaebfvv5.com.br',
        password: '123',
      );
      final result = await UserDAO.insertUser(user);
      return Response(body: result.toJson());
    } catch (e) {
      return Response(statusCode: 401, body: e.toString());
    }
  }

  static Future<Response> getUser(String request) async {
    try {
      const email = 'this';
      final result = await UserDAO.getUser(email);
      return Response(body: result.toJson());
    } catch (e) {
      return Response(statusCode: 401);
    }
  }
}
