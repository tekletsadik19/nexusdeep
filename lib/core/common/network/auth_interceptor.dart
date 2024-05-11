import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:nexusdeep/core/common/app/providers/user_session.dart';
import 'package:nexusdeep/core/services/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor implements InterceptorContract {
  AuthInterceptor(this._prefs, this._userSession);
  final SharedPreferences _prefs;
  final UserSession _userSession;

  @override
  Future<http.BaseRequest> interceptRequest(
      {required http.BaseRequest request}) async {
    final accessToken = sl<SharedPreferences>().getString('accessToken');
    request.headers['Authorization'] = 'Bearer $accessToken';
    return request;
  }

  @override
  Future<http.BaseResponse> interceptResponse(
      {required http.BaseResponse response}) async {
    if (response.statusCode == 401) {
      final newAccessToken = await sl<UserSession>().refreshToken();
      if (newAccessToken != null) {
        final newRequest = copyRequestWithNewToken(
          response.request! as http.Request,
          newAccessToken,
        );
        return http.Client().send(newRequest).then(http.Response.fromStream);
      }
    }
    return response;
  }

  http.Request copyRequestWithNewToken(
    http.Request oldRequest,
    String? newToken,
  ) {
    final newRequest = http.Request(oldRequest.method, oldRequest.url)
      ..headers.addAll(oldRequest.headers)
      ..body = oldRequest.body
      ..encoding = oldRequest.encoding;
    newRequest.headers['Authorization'] = 'Bearer $newToken';

    return newRequest;
  }

  @override
  Future<bool> shouldInterceptRequest() async {
    return true;
  }

  @override
  Future<bool> shouldInterceptResponse() async {
    return true;
  }
}
