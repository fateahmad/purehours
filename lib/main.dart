import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:purehours/routeGenrator.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_background_service_ios/flutter_background_service_ios.dart';
import 'package:purehours/user/usageScreen.dart';
import 'dart:io';
import 'dart:async';

import 'package:purehours/utils/notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  initializeService();
  await Firebase.initializeApp();
  runApp(const Home());
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

void onIosBackground() {
  WidgetsFlutterBinding.ensureInitialized();
}

void onStart() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS) FlutterBackgroundServiceIOS.registerWith();
  if (Platform.isAndroid) FlutterBackgroundServiceAndroid.registerWith();

  final service = FlutterBackgroundService();
  service.onDataReceived.listen((event) {
    if (event!["action"] == "setAsForeground") {
      service.setAsForegroundService();
      return;
    }

    if (event["action"] == "setAsBackground") {
      service.setAsBackgroundService();
    }

    if (event["action"] == "stopService") {
      service.stopService();
    }
  });

  service.setAsForegroundService();
  Timer.periodic(
    const Duration(minutes: 1),
    (timer) async {
      if (!(await service.isRunning())) timer.cancel();
      checkTime();
      service.setNotificationInfo(
        title: "PureHours Service",
        content: "PureHours is running in background for monitoring",
      );
    },
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        FlutterBackgroundService().sendData({"action": "setAsForeground"});
        break;
      case AppLifecycleState.resumed:
        FlutterBackgroundService().sendData({"action": "setAsBackground"});
        break;
      case AppLifecycleState.inactive:
        FlutterBackgroundService().sendData({"action": "setAsForeground"});
        break;
      case AppLifecycleState.detached:
        FlutterBackgroundService().sendData({"action": "setAsBackground"});
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenrator.genrateRoute,
      theme: FlexThemeData.light(scheme: FlexScheme.deepPurple),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.deepPurple),
      themeMode: ThemeMode.light,
    );
  }
}
