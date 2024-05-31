import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:manejador_eventos/config/firebase/firebase_options.dart';


class Messaging{
static FirebaseMessaging messaging = FirebaseMessaging.instance;
static String? token;


static Future _backgroundHandler(RemoteMessage message) async{
print('background handler  ${message.messageId}');
}

static Future _onMessageHandler(RemoteMessage message) async{
print('onMessage handler  ${message.messageId}');
}

static Future _onMessageOpenApp(RemoteMessage message) async{
print('onMessageOpenApp handler ${message.messageId}');
}

static Future initializeApp() async{
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
token = await FirebaseMessaging.instance.getToken();
print('token del dispositivo: $token');

FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
FirebaseMessaging.onMessage.listen(_onMessageHandler);
FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

}

}
