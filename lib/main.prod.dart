import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:owl_hris/app.dart';
import 'package:owl_hris/config/app.config/flavor.type.dart';
import 'package:owl_hris/config/config.dart';
import 'package:owl_hris/firebase_options.dart';
import 'package:owl_hris/injection.container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  final devAppConfig = AppConfig(
    appName: 'OWL ESS',
    flavor: FlavorType.prod,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: 'assets/env/.env.prod');
  Widget app = await initializeApp(devAppConfig);
  // runApp(app);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(app),
  );
}
