import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterproject/SharedPrefence_Service.dart';
import 'package:flutterproject/auth/Auth_Service.dart';
import 'package:flutterproject/auth/Supabase_Client.dart';
import 'package:flutterproject/views/home.dart';
import 'package:flutterproject/views/login.dart';
import 'package:flutterproject/views/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefenceService.initializeSharedPrefence();
  await dotenv.load();
  SupabaseConfig.initializeSupabase();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (SharedPrefenceService.hasAuthId()) {
        String? authId = SharedPrefenceService.prefs?.getString("authId");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(authId: authId!)),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

