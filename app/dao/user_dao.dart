import '../models/user_model.dart';
import 'db_helper.dart';

class UserDAO {
  static const String _tableUser = 'tb_users';

  static Future<UserModel> insertUser(UserModel user) async {
    try {
      final conn = await DBHelper.getConnection();
      await conn.query(
        'insert into $_tableUser (name, email, password) values (?, ?, ?)',
        [user.name, user.email, user.password],
      );
      await conn.close();
      return user;
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserModel?> getUser(String email) async {
    try {
      final conn = await DBHelper.getConnection();
      final result = await conn.query(
        'SELECT email, name FROM $_tableUser where email = ?',
        [email],
      );
      await conn.close();

      if (result.isNotEmpty) {
        for (final row in result) {
          return UserModel(name: row[0] as String, email: row[1] as String);
        }
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
