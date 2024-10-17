import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_asistencia_daemon/lib.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final cacheService = CacheService.getInstance();
    final token = cacheService.getString("token");
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }
}

const errorMsg = {
  "user_not_found": "Usuario no encontrado",
  "role_not_found": "Rol no encontrado",
  "invalid_credentials": "Credenciales inválidas",
  "invalid_token": "Token inválido",
  "token_expired": "Token expirado",
  "token_required": "Debes iniciar sesión",
  "user_already_exists": "Usuario ya existe",
  "user_cannot_be_deleted": "Usuario no puede ser eliminado",
  "user_can_not_be_updated": "Usuario no puede ser actualizado",
  "assistance_not_found": "Asistencia no encontrada",
  "user_is_inactive": "Usuario inactivo",
  "token_revocation_error": "Error al revocar el token",
  "role_cannot_be_deleted": "Rol no puede ser eliminado",
  "role_cannot_be_updated": "Rol no puede ser actualizado",
  "role_already_exists": "Rol ya existe",
  "permission_not_found": "Permiso no encontrado",
  "permissions_not_found_read_user":
      "Permisos no encontrados para leer usuario",
  "permission_not_found_create_user":
      "Permiso no encontrado para crear usuario",
  "permission_not_found_update_user":
      "Permiso no encontrado para actualizar usuario",
  "permission_not_found_delete_user":
      "Permiso no encontrado para eliminar usuario",
  "permission_not_found_create_role": "Permiso no encontrado para crear rol",
  "permission_not_found_read_role": "Permiso no encontrado para leer rol",
  "permission_not_found_update_role":
      "Permiso no encontrado para actualizar rol",
  "permission_not_found_delete_role": "Permiso no encontrado para eliminar rol",
  "permission_not_found_create_permission":
      "Permiso no encontrado para crear permiso",
  "permission_not_found_read_permission":
      "Permiso no encontrado para leer permiso",
  "permission_not_found_read_assistance":
      "Permiso no encontrado para leer asistencia",
  "permission_not_found_create_assistance":
      "Permiso no encontrado para crear asistencia",
  "permission_not_found_update_assistance":
      "Permiso no encontrado para actualizar asistencia",
  "permission_not_found_delete_assistance":
      "Permiso no encontrado para eliminar asistencia",
  "permission_not_found_login_authentication":
      "Permiso no encontrado para autenticación de inicio de sesión",
  "permission_not_found_logout_authentication":
      "Permiso no encontrado para autenticación de cierre de sesión",
  "permission_not_found_read_refresh_authentication":
      "Permiso no encontrado para leer autenticación de actualización",
  "permission_not_found_verify_authentication":
      "Permiso no encontrado para verificar autenticación",
  "500": "Error interno del servidor",
  "403": "No tienes permiso para realizar esta acción",
};

class PushAlertInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 500) {
      BlocProvider.of<PushAlertBloc>(scaffoldKey.currentContext!)
          .add(PushAlertBasicError(
        title: "Ups! algo salió mal",
        body: errorMsg["500"]!,
      ));
    }

    if (err.response?.data != null) {
      final data = err.response!.data;
      if (data is Map<String, dynamic> && data.containsKey("message")) {
        BlocProvider.of<PushAlertBloc>(pushAlertKey.currentContext!)
            .add(PushAlertBasicError(
          title: "Ups! algo salió mal",
          body: errorMsg[data["message"]]!,
        ));
      }
    }
    super.onError(err, handler);
  }
}

final Dio _dio = Dio(BaseOptions(baseUrl: "http://165.227.65.68:8000/api/"))
  ..interceptors.add(LogInterceptor(
    responseBody: true,
    requestBody: true,
    requestHeader: true,
    responseHeader: true,
  ))
  ..interceptors.add(TokenInterceptor())
  ..interceptors.add(PushAlertInterceptor());

class HttpClient {
  static HttpClient? _instance;

  HttpClient._();

  static HttpClient getInstance() {
    _instance ??= HttpClient._();
    return _instance!;
  }

  Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body) async {
    final response = await _dio.post(url, data: body);
    return response.data ?? {};
  }

  Future<Map<String, dynamic>> get(String url,
      [Map<String, dynamic>? params]) async {
    final response = await _dio.get(url, queryParameters: params);
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      String url, Map<String, dynamic> body) async {
    final response = await _dio.put(url, data: body);
    return response.data;
  }

  Future<Map<String, dynamic>> delete(String url) async {
    final response = await _dio.delete(url);
    return response.data;
  }

  Future<Map<String, dynamic>> patch(
      String url, Map<String, dynamic> body) async {
    final response = await _dio.patch(url, data: body);
    return response.data;
  }
}