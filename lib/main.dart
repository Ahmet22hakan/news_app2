import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';
import 'constants/constants.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
   OneSignal.initialize("9b805b58-8e7e-47e6-89b8-6e10259a5107");
   OneSignal.Notifications.requestPermission(true);
  Directory directory = await getApplicationDocumentsDirectory();
 
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));

  initializeDateFormatting('tr_TR', null).then((_) => runApp(
        MyApp(),
      ));
}
