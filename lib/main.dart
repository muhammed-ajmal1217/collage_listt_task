import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softronictask/controller/api_provider.dart';
import 'package:softronictask/views/collage_list_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ApiProvider(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CollageListpage(),
      ),
    );
  }
}