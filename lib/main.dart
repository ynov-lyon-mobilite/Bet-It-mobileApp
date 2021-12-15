import 'package:bet_it/model/firebase_database.dart';
import 'package:bet_it/model/instance_manager.dart';
import 'package:bet_it/screens/home_page.dart';
import 'package:bet_it/screens/login_page.dart';
import 'package:bet_it/screens/profile_page.dart';
import 'package:bet_it/screens/register_page.dart';
import 'package:bet_it/utils/debug_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return FutureBuilder(
      future: FirebaseDatabase.initialize(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          DebugLogger.debugLog("main.dart", "build", "Firebase initialized", 3);

          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('fr','FR')
            ],
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: InstanceManager.getFireAuthInstance().currentUser == null ? const LoginPage() : const MyHomePage(),
            routes: {
              '/register': (context) => const RegisterPage(),
              '/profile': (context) => const ProfilePage(),
              '/home': (context) => const MyHomePage(),
              '/login': (context) => const LoginPage(),
            },
          );
        }
        if(snapshot.hasError){
          DebugLogger.debugLog("main.dart", "build", "Firebase initialization failed !", 1);

          return const Scaffold();
        }
        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}

