import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dependency_container.dart' as di;
import 'myApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // await CustomThermalPrinter.instance.initPlatformState();

  FlutterSecureStorage(aOptions: _getAndroidOptions());
  // CustomThermalPrinter.instance.connect();
  runApp(const MyApp());
}

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
