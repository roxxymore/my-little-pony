import 'package:flutter/material.dart';
import 'package:my_first_apk/src/templates/character_template.dart';

class DetailsPage extends StatefulWidget {
  final CharacterTemplate characterTemplate;
  @override
  _DetailsPageState createState() {
    return _DetailsPageState();
  }

  DetailsPage({required this.characterTemplate, key}) : super(key: key);
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 1,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(
                  widget.characterTemplate.name,
                  style: const TextStyle(color: Colors.black),
                ),
                expandedHeight: 300,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              widget.characterTemplate.image.first))),
                ),
                pinned: true,
                bottom: const TabBar(tabs: <Widget>[
                  Tab(
                    child: Text(
                      "Information",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  )
                ]),
                actions: <Widget>[
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ))
                ],
              )
            ];
          },
          body: TabBarView(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: ListView(
                children: [
                  const Text(
                    "Alias",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Text(widget.characterTemplate.alias == ""
                      ? "Don't has"
                      : widget.characterTemplate.alias),
                  const Divider(
                    height: 10,
                  ),
                  const Text(
                    "Occupation",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Text(widget.characterTemplate.occupation == ""
                      ? "Don't has"
                      : widget.characterTemplate.occupation),
                  const Divider(
                    height: 10,
                  ),
                  const Text(
                    "Sex",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Text(widget.characterTemplate.sex == ""
                      ? "Don't has"
                      : widget.characterTemplate.sex),
                  const Divider(
                    height: 10,
                  ),
                  const Text(
                    "Residence",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Text(widget.characterTemplate.residence == ""
                      ? "Don't has"
                      : widget.characterTemplate.residence),
                  const Divider(
                    height: 10,
                  ),
                  const Text("Kind",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Column(
                    children: List.generate(
                        widget.characterTemplate.kind.length, (index) {
                      final kind = widget.characterTemplate.kind[index];
                      return ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor),
                          height: 15,
                          width: 15,
                        ),
                        title: Text(kind),
                      );
                    }),
                  )
                ],
              ),
            )
          ])),
    ));
  }
}
