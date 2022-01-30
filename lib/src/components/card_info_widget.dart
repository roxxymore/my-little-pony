import 'package:flutter/material.dart';
import 'package:my_first_apk/src/templates/character_template.dart';

class CardInfo extends StatelessWidget {
  final VoidCallback onChange;
  final CharacterTemplate characterTemplate;

  const CardInfo({required this.characterTemplate, required this.onChange, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Card(
        child: GestureDetector(
          onTap: () {
            _showDetails(context);
          },
          child: Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(characterTemplate.image.first),
            )),
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.black.withOpacity(0.35),
              child: ListTile(
                title: Text(
                  characterTemplate.name,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  characterTemplate.alias,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                    onPressed: () {
                      //Marcar como favorito
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDetails(BuildContext context) {
    Navigator.pushNamed(context, "/details", arguments: characterTemplate);
  }
}
