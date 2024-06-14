import 'dart:async';

class ApiResult {
  StreamController<int> statusCode = StreamController();

  static final ApiResult _instance = ApiResult.internal();

  ApiResult.internal();

  factory ApiResult() => _instance;

  setStatusCode(int? statusCodeResult) {
    if (!statusCode.isClosed) {
      statusCode.add(statusCodeResult ?? 0);
    }
  }

  StreamController<int> listenStatusCode() {
    statusCode = StreamController();
    return statusCode;
  }

  closeStream() {
    statusCode.close();
  }
}