import 'dart:async';

import 'package:control_asistencia_daemon/lib.dart';

class AuthenticationService {
  final HttpClient _client;
  static AuthenticationService? _instance;

  AuthenticationService(this._client);

  static AuthenticationService getInstance() {
    _instance ??= AuthenticationService(HttpClient.getInstance());
    return _instance!;
  }

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    final response = await _client.post(
      "/auth/login",
      {"email": email, "password": password},
    );
    return response["access_token"];
  }

  FutureOr<Member> get loggedInMember {
    return _client.get("/auth/me").then((response) {
      return Member.fromJson(response);
    });
  }

  Future<void> signOut() async {
    await _client.post("/auth/logout", {});
  }

  Future<void> resetPassword({
    required int userId,
    required String password,
  }) async {
    await _client.post("/auth/$userId/reset-password", {
      "password": password,
    });
  }
}

class AuthenticationAppCCValleduparService {
  final HttpClientAppCCvalledupar _client;
  static AuthenticationAppCCValleduparService? _instance;

  AuthenticationAppCCValleduparService(this._client);

  static AuthenticationAppCCValleduparService getInstance() {
    _instance ??= AuthenticationAppCCValleduparService(
      HttpClientAppCCvalledupar.getInstance(),
    );
    return _instance!;
  }

  Future<MemberAppCCvalledupar> signInWithEmailAndPassword(
      String email, String password) async {
    final response = await _client.post(
      "/autenticar",
      {
        "username": email,
        "pass": password,
      },
    );

    return MemberAppCCvalledupar.fromJson(response["data"]);
  }
}
