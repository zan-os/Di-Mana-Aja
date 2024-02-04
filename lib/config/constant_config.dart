import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstantConfig {
  ConstantConfig._private() {
    baseUrl = dotenv.get('BASE_URL');
    apiKey = dotenv.get('API_KEY');
    gidClientId = dotenv.get('GID_CLIENT_ID');
  }

  static final ConstantConfig _instance = ConstantConfig._private();

  factory ConstantConfig() => _instance;

  String baseUrl = '';
  String apiKey = '';
  String gidClientId = '';
}
