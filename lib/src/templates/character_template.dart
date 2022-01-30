class CharacterTemplate {
  int id;
  String name;
  String alias;
  String url;
  String sex;
  String residence;
  String occupation;
  List<dynamic> image;
  List<dynamic> kind;

  CharacterTemplate(
      {required this.id,
      required this.name,
      required this.alias,
      required this.url,
      required this.sex,
      required this.residence,
      required this.occupation,
      required this.image,
      required this.kind});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'alias': alias,
      'url': url,
      'sex': sex,
      'residence': residence,
      'occupation': occupation,
    };
  }
}
