import 'package:cloud_firestore/cloud_firestore.dart';

class Story {
  String? id;
  String? userID;
  String? devfestID;
  String? text;
  String? imgUrl;
  List<String> likes;
  // List<String> comments;
  DateTime? date;

  Story({
    this.id,
    this.userID,
    this.devfestID,
    this.text,
    this.imgUrl,
    this.likes = const [],
    this.date,
  });

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: map['id'],
      userID: map['userID'],
      devfestID: map['devfestID'],
      text: map['text'],
      imgUrl: map['imgUrl'],
      likes: map['likes'],
      date: map.containsKey('date') && map['date'] != null
          ? (map['date'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userID": userID,
      "devfestID": devfestID,
      "text": text,
      "imgUrl": imgUrl,
      "likes": likes,
      "date": date != null ? Timestamp.fromDate(date!) : Timestamp.now(),
    };
  }
}

List<Story> stories = List.generate(
    30,
    (i) => Story(
          id: "qljfncqsld${i}lfdvkqjd",
          userID: "slhdbcl${i}qjsdcn",
          devfestID: "Devfest Sousse 2k21",
          date: DateTime.now(),
          imgUrl:
              "https://i.pinimg.com/originals/6d/6d/a1/6d6da1386014c5a3d5877a14488eeb5d.jpg",
          likes: ["slhdbcl${i}qjsdcn"],
          text:
              "Eu laboris laborum dolore velit incididunt Lorem ea aliquip. Cupidatat excepteur ut aliquip proident do minim veniam cillum incididunt. Velit quis sit dolor consectetur ex anim sit cillum ullamco nisi ipsum enim pariatur.",
        ));
