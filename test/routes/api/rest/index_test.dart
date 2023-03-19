import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../routes/api/rest/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

void main() {
  group('GET /', () {
    test('responds with a 200 and "método: get".', () async {
      final context = _MockRequestContext();
      final request = Request.get(
        Uri.parse('http://localhost:8080/api/rest'),
      );
      when(() => context.request).thenReturn(request);
      final response = route.onRequest(context);

      expect(response.statusCode, equals(HttpStatus.ok));
      expect(
        response.body(),
        completion(equals('método: get')),
      );
    });
  });
}
