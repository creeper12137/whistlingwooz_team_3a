class Event {
  final int uid;
  String type;
  String theme;
  String function;
  String venue;
  int guestNo;
  String budget;
  String email;
  String phoneNo;

  Event(
    this.uid,
    this.type,
    this.theme,
    this.function,
    this.venue,
    this.guestNo,
    this.budget,
    this.email,
    this.phoneNo,
  );

  toJson() {
    return {
      "uid": uid,
      "type": type,
      "theme": theme,
      "fundtion": function,
      "venue": venue,
      "guestNo": guestNo,
      "budget": budget,
      "email": email,
      "phoneNo": phoneNo,
    };
  }

  int get id {
    return uid;
  }

  String get eventType {
    return type;
  }

  void setEventType(String newType) {
    type = newType;
  }

  String get eventTheme {
    return theme;
  }

  void setEventTheme(String newTheme) {
    if (newTheme.isEmpty == true) {
      // debugPrint('Theme must be filled.');
      return;
    }
    theme = newTheme;
  }

  String get eventFunction {
    return function;
  }

  void setEventFunction(String newFunction) {
    if (newFunction.isEmpty == true) {
      // debugPrint('Function must be filled.');
      return;
    }
    function = newFunction;
  }

  String get eventVenue {
    return venue;
  }

  void setEventVenue(String newVenue) {
    if (newVenue.isEmpty == true) {
      // debugPrint('Venue must be filled.');
      return;
    }
    venue = newVenue;
  }

  int get eventGuestNo {
    return guestNo;
  }

  void setEventGuestNo(int newGuestNo) {
    if (newGuestNo < 0 || newGuestNo > 500) {
      // debugPrint('Invalid guest numbers.');
      return;
    }
    guestNo = newGuestNo;
  }

  String get eventBudget {
    return budget;
  }

  void setEventBudget(String newBudget) {
    if (newBudget.isEmpty == true) {
      // debugPrint('Budget must be filled.');
      return;
    }
    budget = newBudget;
  }

  String get eventEmail {
    return email;
  }

  void setEventEmail(String newEmail) {
    if (!newEmail.contains('@')) {
      // debugPrint('Invalid email address.');
      return;
    }
    email = newEmail;
  }

  String get eventPhoneNo {
    return phoneNo;
  }

  void setEventPhoneNo(String newPhoneNo) {
    if (newPhoneNo.length != 10) {
      // debugPrint('Phone number must be 10 digits long.');
      return;
    }
    phoneNo = newPhoneNo;
  }
}
