import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_first_apk/src/components/card_info_widget.dart';
import 'package:my_first_apk/src/templates/character_template.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CharacterTemplate>?> futureCharacterTemplate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: futureCharacterTemplate,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final list = snapshot.data;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    CharacterTemplate template = list[index];
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                        child: CardInfo(
                          characterTemplate: template,
                          onChange: () {
                            setState(() {});
                          },
                        ));
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    futureCharacterTemplate = fetchCharacters();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<CharacterTemplate>?> fetchCharacters() async {
    final response =
        await http.get(Uri.parse('http://ponyweb.ml/v1/character/all'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<CharacterTemplate>? characters = List.empty(growable: true);
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> data = json['data'];
      for (var element in data) {
        characters.add(CharacterTemplate(
            id: element['id'],
            name: element['name'] ?? "",
            alias: element['alias'] ?? "",
            url: element['url'] ?? "",
            sex: element['sex'] ?? "",
            residence: element['residence'] ?? "",
            occupation: element['occupation'] ?? "",
            image: element['image'],
            kind: element['kind']));
      }
      return characters;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load characters');
    }
  }
}
