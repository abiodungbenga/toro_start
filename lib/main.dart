import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:toro_start/constants/app_constants.dart';
import 'package:toro_start/helpers/dependencies.dart'as dep;
import 'package:toro_start/routes/routes.dart';
import 'package:toro_start/themes/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  AppTheme get appTheme => AppTheme();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          useInheritedMediaQuery: true,
          darkTheme: appTheme.dark,
          theme: appTheme.light,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          getPages: RouteHelpers.routes,
          initialRoute: RouteHelpers.initial,
          title: AppConstants.appName,
        );
      }
    );
  }
}

