import 'package:flutter/material.dart';
import 'package:my_first_apk/src/screens/details_page.dart';
import 'package:my_first_apk/src/screens/home_page.dart';
import 'package:my_first_apk/src/templates/character_template.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryIconTheme: const IconThemeData(color: Colors.white),
          iconTheme: const IconThemeData(color: Colors.white)),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          switch (settings.name) {
            case "/details":
              CharacterTemplate characterTemplate = settings.arguments as CharacterTemplate;
              return DetailsPage(key: key, characterTemplate: characterTemplate,);
            case "/":
              return const HomePage(title: "My Little Pony");
            default:
              return const HomePage(title: "My Little Pony");
          }
        });
      },
    );
  }
}
