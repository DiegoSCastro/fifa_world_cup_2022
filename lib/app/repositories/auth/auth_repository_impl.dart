import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fifa_world_cup_2022/app/core/exceptions/repository_exception.dart';
import 'package:fifa_world_cup_2022/app/core/exceptions/unauthorized_exception.dart';
import 'package:fifa_world_cup_2022/app/core/rest/custom_dio.dart';
import 'package:fifa_world_cup_2022/app/models/register_user_model.dart';
import 'package:fifa_world_cup_2022/app/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<void> register(RegisterUserModel registerUserModel) async {
    try {
      await dio.unAuth().post(
            '/api/register',
            data: registerUserModel.toMap(),
          );
    } on DioError catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar usuário');
    }
  }

  @override
  Future<String> login({required String email, required String password}) async {
    try {
      final result = await dio.post('/api/auth', data: {
        'email': email,
        'password': password,
      });

      final accessToken = result.data['access_token'];
      if (accessToken == null) {
        throw UnauthorizedException();
      } else {
        return accessToken;
      }
    } on DioError catch (e, s) {
      log('Erro ao realizer login', error: e, stackTrace: s);
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw RepositoryException(message: 'Erro ao realizar login');
      }
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
