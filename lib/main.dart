import 'package:flutter/material.dart';
import 'package:pixzzaapp/HomePage.dart';
import 'package:pixzzaapp/Provider/CartProv.dart';
import 'package:pixzzaapp/Provider/LikesProv.dart';
import 'package:pixzzaapp/Provider/OrderProv.dart';
import 'package:pixzzaapp/navigationcustom.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
  // FlutterNativeSplash.remove();
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>LikesProv()),
      ChangeNotifierProvider(create: (_)=>CartProv()),
      ChangeNotifierProvider(create: (_)=>OrderProv())
    ],
    child:
    MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      routes: {
        '/HomePage': (context) => HomePage(),
        '/Navigation Custom': (context) => navigationcustom()
        // '/order': (context) => order(),
        // Other routes...
      },
      home: navigationcustom(),
    ));
  }
}
