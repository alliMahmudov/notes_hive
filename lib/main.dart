import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_hive/data/adapters/phone_adapter.dart';
import 'package:notes_hive/ui/hive_first_sample.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox('notes');
  Hive.registerAdapter(PhoneAdapter());
  await Hive.openBox('phone');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HiveFirstSample(),
    );
  }
}
