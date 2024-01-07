class Survey {
  final String id;
  final String message;

  const Survey({
    required this.id,
    required this.message,
  });

  toJson() {
    return {
      "id": id,
      "message": message,
    };
  }

  String get eventId {
    return id;
  }

  String get getMessage {
    return message;
  }
}
