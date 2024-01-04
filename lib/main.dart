import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.Debug.setLogLevel(OSLogLevel.error);
  OneSignal.initialize("9b805b58-8e7e-47e6-89b8-6e10259a5107");
  OneSignal.Notifications.requestPermission(true);

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));

  initializeDateFormatting('tr_TR', null).then((_) => runApp(
        MyApp(),
      ));
}
