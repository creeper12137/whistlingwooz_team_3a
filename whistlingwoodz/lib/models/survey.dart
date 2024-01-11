import 'package:cloud_firestore_platform_interface/src/timestamp.dart';

class Survey {
  final String id;
  final String message;
  Timestamp timeStamp;
  Survey({
    required this.id,
    required this.message,
    required this.timeStamp,
  });

  toJson() {
    return {
      "id": id,
      "message": message,
      'timeStamp': timeStamp,
    };
  }

  String get eventId {
    return id;
  }

  String get getMessage {
    return message;
  }
}
