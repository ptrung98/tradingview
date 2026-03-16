import 'package:dio/dio.dart';
import 'package:loogix_trading/core/config/app_config.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(AppConfig config)
      : _dio = Dio(
          BaseOptions(
            baseUrl: config.baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        );

  Dio get dio => _dio;
}

