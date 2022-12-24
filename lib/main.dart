import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/wrapper.dart';
import 'package:movies/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(StreamProvider<User?>.value(
    value: AuthService().user,
    initialData: null,
    child: const MaterialApp(
      home: Wrapper(),
    ),
  ));
}