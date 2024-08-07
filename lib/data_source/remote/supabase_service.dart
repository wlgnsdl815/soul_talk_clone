import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  final SupabaseClient client;

  factory SupabaseService() => _instance;

  SupabaseService._internal() : client = Supabase.instance.client;
}
