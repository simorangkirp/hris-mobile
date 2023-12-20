import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  Endpoints._();

  // base url
  static String baseURL = dotenv.get("BASE_URL");
  static String urlSDM = dotenv.get("SDM_URL");
  static String urlUSER = dotenv.get("USER_URL");
  static String urlAPPROVAL = dotenv.get("APPROVAL_URL");
  static String urlAUTH = dotenv.get("AUTH_URL");
  static String urlNOTIF = dotenv.get("NOTIF_URL");
  static String urlLEAVE = dotenv.get("LEAVE_URL");

  // receiveTimeout
  static const Duration receiveTimeout = Duration(minutes: 5);

  // connectTimeout
  static const Duration connectionTimeout = Duration(minutes: 5);
}
