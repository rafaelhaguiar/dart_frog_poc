import 'package:dart_frog/dart_frog.dart';

import '../../../app/controllers/user_controller.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request.method.name;
  switch (request) {
    case 'post':
      return UserController.insertUser(request);
    case 'GET':
      final result = await UserController.getUser(request);
      return result;
    default:
      return Response(statusCode: 500);
  }
}
