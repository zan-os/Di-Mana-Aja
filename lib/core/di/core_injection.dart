import 'package:di_mana_aja/registered_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CoreInjection {
  CoreInjection() {
    _registerSupabase();
  }

  void _registerSupabase() async {
    sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  }
}
