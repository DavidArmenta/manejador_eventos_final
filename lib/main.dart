import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manejador_eventos/config/firebase/firebase_options.dart';
import 'package:manejador_eventos/config/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:manejador_eventos/presentation/providers/messaging.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value)
  {
    if(value)
    {
      Permission.notification.request();
    }
  });
  await Messaging.initializeApp();
  runApp(const ProviderScope(child: MyApp()) );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State createState() {
  return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>{
  @override
  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
  return MaterialApp.router(
    debugShowCheckedModeBanner: false,
    title: "Manejador de Eventos",
    routerConfig: appRouter,

  ) ;
  }
}

