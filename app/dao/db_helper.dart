import 'package:mysql1/mysql1.dart';

class DBHelper {
  factory DBHelper() {
    return _intance;
  }
  DBHelper._internal();
  static final DBHelper _intance = DBHelper._internal();

  static Future<MySqlConnection> getConnection() async {
    return MySqlConnection.connect(
      ConnectionSettings(db: 'frog_db', user: 'root'),
    );
  }
}
