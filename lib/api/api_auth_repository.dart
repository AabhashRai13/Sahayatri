import 'package:sahayatri/models/diagnostic/diagnostic.dart' ;
import 'package:sahayatri/models/login/login_body.dart';
import 'package:sahayatri/models/refresh/refresh_token_body.dart';
import 'package:sahayatri/models/register/register.dart';
import 'package:sahayatri/models/token/token.dart';
import 'package:sahayatri/models/user/user.dart';

import 'api_auth_provider.dart';
class ApiAuthRepository {
  final ApiAuthProvider _apiAuthProvider = ApiAuthProvider ();

  Future <Diagnostic> postRegisterUser (Register register) => _apiAuthProvider.registerUser (register);

  Future <Token> postLoginUser (LoginBody loginBody) => _apiAuthProvider.loginUser (loginBody);

  Future <Token> postRefreshAuth (RefreshTokenBody refreshTokenBody) => _apiAuthProvider.refreshAuth (refreshTokenBody);

  Future <User> fetchAllUsers () => _apiAuthProvider.getAllUsers ();
}