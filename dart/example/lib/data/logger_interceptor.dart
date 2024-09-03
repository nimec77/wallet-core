import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggerInterceptor extends InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    request.headers.addAll({'Content-Type': 'application/json'});
    debugPrint(_cURLRepresentation(request));

    return Future.value(request);
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    debugPrint('----- Response -----');
    debugPrint('Code: ${response.statusCode}');
    if (response is Response) {
      debugPrint((response).body);
    }

    return response;
  }

  String _cURLRepresentation(BaseRequest request) {
    List<String> components = ['\$ curl -i'];

    components.add('-X ${request.method}');

    request.headers.forEach((k, v) {
      if (k.toLowerCase() != 'cookie') {
        components.add('-H \'$k: $v\'');
      }
    });

    if (request is Request) {
      debugPrint(request.body);

      var data = jsonEncode(request.body);
      data = data.replaceAll('\'', '\\\'');
      components.add('-d \'$data\'');

      components.add('\'${request.url}\'');
    }

    return components.join('\\\n\t');
  }
}
