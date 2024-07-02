import 'dart:async';
import 'dart:developer';
import 'package:digirh/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:digirh/core/common_used/app_prefs.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/core/routes/app_router.dart';
import 'package:digirh/core/injection/injection_container.dart' as container;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:digirh/core/routes/app_router.gr.dart';
import 'package:digirh/core/injection/injection_container.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await container.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(
    const MyApp(),
  );
}

final appRouter = sl<AppRouter>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription<String>? _languageSubscription;
  late String local;

  @override
  void initState() {
    super.initState();
    local = sl<AppPrefs>().getAppLanguage() ?? "en";
    _languageSubscription = AppPrefs.languageStream.listen((language) {
      setState(() {
        local = language;
      });
    });
    _navigateBasedOnAuth();
  }

  Future<void> _navigateBasedOnAuth() async {
    String? role = sl<AppPrefs>().getRole();
    String? token = sl<AppPrefs>().getToken();
    log(role ?? "role is null");
    log(token ?? "token is null");
    if (role != null && token != null) {
      // switch (role) {
      //   case "citizen":
      //     appRouter.push(const CitizenAppFrame());
      //   case 'driver':
      //     appRouter.push(const DriverAppFrame());
      //   case 'admin':
      //     appRouter.push(const AdminAppFrame());
      //   default:
      //     appRouter.push(const LoginRoute());
      // }
    } else {
      appRouter.push(const LoginRoute());
    }

    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    _languageSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF2F2F2),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ), // Setting the BottomNavigationBar background color to black
        // Set background color to black
      ),
    );
  }
}
