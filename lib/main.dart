import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanderer/core/app_export.dart';
import 'package:wanderer/core/utils/navigator_service.dart';
import 'package:wanderer/core/utils/size_utils.dart';
import 'package:wanderer/routes/app_routes.dart';
import 'package:wanderer/theme/bloc/theme_bloc.dart';
import 'package:wanderer/theme/theme_helper.dart';

import 'core/utils/pref_utils.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
int initScreen = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen") ?? 0;
  await prefs.setInt("initScreen", 1);
  Future.wait([
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) =>
              ThemeBloc(
                ThemeState(
                  themeType: PrefUtils().getThemeData(),
                ),
              ),
          child:  BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                theme: theme,
                title: 'Wanderer',
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                supportedLocales: [
                  Locale(
                    'en',
                    '',
                  ),
                ],
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
