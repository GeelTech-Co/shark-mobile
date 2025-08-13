import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // أضف هذا
import 'package:shark_mobile/core/di/dependancy_injection.dart';
import 'package:shark_mobile/core/routing/app_router.dart';
import 'package:shark_mobile/shark_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupGetit();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: SharkApp(appRouter: AppRouter()),
    ),
  );
}
