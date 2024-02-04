enum Flavor { development, production }

class FlavorValue {
  FlavorValue({required this.baseUrl});

  final String baseUrl;
}

class FlavorConfig {
  FlavorConfig._internal();

  static final FlavorConfig _instance = FlavorConfig._internal();

  static FlavorConfig get instance => _instance;
}

// class FlavorConfig {
//   static FlavorConfig _instance;
  
//   factory FlavorConfig() {
//     _instance ?? FlavorConfig._instance;
//     return _instance;
//   }

//   Flavor flavor;
//   String name;
//   Color colorPrimary;
//   Color colorAccent;
//   FlavorValue flavorValue;

//   FlavorConfig._internal(
//     this.flavor,
//     this.name,
//     this.colorPrimary,
//     this.colorAccent,
//     this.flavorValue,
//   );

//   static String enumName(String enumToString) {
//     final paths = enumToString.split('.');
//     return paths[paths.length - 1];
//   }
// }

// flavor = flavor;
//     name = enumName(flavor.toString());
//     colorPrimary = ColorPalette.purple;
//     colorAccent = ColorPalette.white;
//     flavorValue = flavorValue;