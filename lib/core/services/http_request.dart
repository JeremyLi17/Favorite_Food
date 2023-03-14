
import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout
  );
  // 创建dio对象
  static final Dio dio = Dio(baseOptions);

  // request方法
  static Future<T> request<T>(String url,
      {
        String method = "get",
        Map<String, dynamic>? params,
        Interceptor? inter
      }) async
  {
    // 创建单独配置
    final options = Options(method: method);

    // 全局拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (options, handler) {
          print("请求拦截");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("响应拦截");
          return handler.next(response);
        },
        onError: (err, handler) {
          print("错误拦截$err");
          return handler.next(err);
        }
    );
    // 加入将默认的拦截器
    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }

    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);

    // 2.发送网络请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}