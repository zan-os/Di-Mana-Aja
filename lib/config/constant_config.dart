import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstantConfig {
  ConstantConfig._private() {
    baseUrl = dotenv.get('BASE_URL');
    apiKey = dotenv.get('API_KEY');

    basePathCourseImage = dotenv.get('BASE_PATH_COURSE_IMAGE');
  }

  static final ConstantConfig _instance = ConstantConfig._private();

  factory ConstantConfig() => _instance;

  String baseUrl = '';
  String apiKey = '';

  String basePathCourseImage = '';
}
