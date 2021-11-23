class User {
  String? id;
  String? fullName;
  late String _imgUrl =
      "https://avatars.dicebear.com/api/adventurer-neutral/$fullName.svg";
  String get imgUrl => _imgUrl;

  User({this.id, this.fullName});
  factory User.fromMap(Map map) {
    return User(
      id: map['id'],
      fullName: map['fullName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fullName": fullName,
    };
  }
}

User user = User(id: "someIdqlsbciqudc", fullName: "Oussama Maatallah");
