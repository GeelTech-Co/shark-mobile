  import 'package:easy_localization/easy_localization.dart';
  import 'package:flutter/material.dart';
  import 'package:shark_mobile/core/routing/app_router.dart';
  import 'package:shark_mobile/core/routing/routes.dart';
  import 'package:shark_mobile/core/themes/colors.dart';

  class SharkApp extends StatelessWidget {
    const SharkApp({super.key, required this.appRouter});
    final AppRouter appRouter;

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: Routes.onboardingScreen,
        onGenerateRoute: appRouter.generateRoutes,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: ColorsManager.mainBlue,
        ),
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: widget ?? const SizedBox.shrink(),
          );
        },
      );
    }
  }
