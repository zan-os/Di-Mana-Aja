import 'package:di_mana_aja/config/constant_config.dart';
import 'package:di_mana_aja/registered_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CoreInjection {
  CoreInjection() {
    _registerSupabase();
    _registerConstantConfig();
  }

  void _registerSupabase() async {
    sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  }

  void _registerConstantConfig() {
    sl.registerLazySingleton(() => ConstantConfig());
  }
}
