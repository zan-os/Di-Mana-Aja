import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstantConfig {
  ConstantConfig._private() {
    baseUrl = dotenv.get('BASE_URL');
    apiKey = dotenv.get('API_KEY');
    baseResourceUrl = dotenv.get('BASE_RESOURCE_URL');
    basePathCourseImage = dotenv.get('BASE_COURSE_IMAGE_PATH');
  }

  static final ConstantConfig _instance = ConstantConfig._private();

  factory ConstantConfig() => _instance;

  String baseUrl = '';
  String apiKey = '';
  String baseResourceUrl = '';
  String basePathCourseImage = '';
}
