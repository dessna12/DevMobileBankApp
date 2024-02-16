import 'package:bankenstein/data/authentication_data_source.dart';
import 'package:bankenstein/models/user.dart';

abstract class AuthenticationService {

  static Future<User> login(String email, String password) async {
    final String token = await AuthenticationDataSource.login(email, password);
    final user = User(email: email, token: token);

    return user;
  }

}