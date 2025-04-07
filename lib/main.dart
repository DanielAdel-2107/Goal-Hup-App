import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:goal_hup/app/my_app.dart';
import 'package:goal_hup/core/di/dependancy_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://ebyxjcbgakjfcllwucxy.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVieXhqY2JnYWtqZmNsbHd1Y3h5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA3MzQwNDUsImV4cCI6MjA1NjMxMDA0NX0.vnJPJ9xzYyzSyFPpdhjmwVGMTVckQ3B6DPcpUuVUL14",
  );
  setupDI();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}
