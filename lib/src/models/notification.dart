import 'package:cloud_firestore/cloud_firestore.dart';

class DevNotification {
  String? id;
  String? userID;
  String? storyID;
  String? text;
  DateTime? date;

  DevNotification({
    this.id,
    this.userID,
    this.storyID,
    this.text,
    this.date,
  });

  factory DevNotification.fromMap(Map<String, dynamic> map) {
    return DevNotification(
      id: map['id'],
      userID: map['userID'],
      storyID: map['storyID'],
      text: map['text'],
      date: map.containsKey('date') && map['date'] != null
          ? (map['date'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userID": userID,
      "storyID": storyID,
      "text": text,
      "date": date != null ? Timestamp.fromDate(date!) : Timestamp.now(),
    };
  }
}
