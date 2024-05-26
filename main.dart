import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:your_project_name/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
