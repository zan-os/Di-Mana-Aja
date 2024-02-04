import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstantConfig {
  ConstantConfig._private() {
    baseUrl = dotenv.get('BASE_URL');
    apiKey = dotenv.get('API_KEY');
  }

  static final ConstantConfig _instance = ConstantConfig._private();

  factory ConstantConfig() => _instance;

  // static final ConstantConfig _instance = ConstantConfig._private();

  // factory ConstantConfig() => _instance;

  // static ConstantConfig get instance => _instance;

  String baseUrl = '';
  String apiKey = '';
}
