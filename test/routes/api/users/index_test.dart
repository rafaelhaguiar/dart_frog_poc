import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../routes/api/users/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

void main() {
  group('GET /', () {
    test('responds with a 200 and "id = 221".', () async {
      final context = _MockRequestContext();
      final request = Request.get(
        Uri.parse('http://localhost:8080/api/users?id=221'),
      );
      when(() => context.request).thenReturn(request);
      final response = route.onRequest(context);

      expect(response.statusCode, equals(HttpStatus.ok));
      expect(
        response.body(),
        completion(equals('id = 221')),
      );
    });
  });
}
