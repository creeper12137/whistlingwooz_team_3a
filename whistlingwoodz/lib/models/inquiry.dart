class Inquiry {
  final int uid;
  String fullName;
  String email;
  String phoneNo;
  String eventType;
  String message;

  Inquiry(
    this.uid,
    this.fullName,
    this.email,
    this.phoneNo,
    this.eventType,
    this.message,
  );

  toJson() {
    return {
      "uid": uid,
      "type": fullName,
      "theme": email,
      "fundtion": phoneNo,
      "venue": eventType,
      "guestNo": message,
    };
  }

  int get id {
    return uid;
  }

  String get name {
    return fullName;
  }

  void setName(String newName) {
    if (newName.length < 3 || newName.length > 50) {
      //throw error
      // debugPrint('Name must be between 3 and 50 characters long.');
      return;
    }
    fullName = newName;
  }

  String get userEmail {
    return email;
  }

  void setUserEmail(String newEmail) {
    if (newEmail.length < 3 || newEmail.length > 50) {
      //throw error
      // debugPrint('Email must be between 3 and 50 characters long.');
      return;
    }
    email = newEmail;
  }

  String get userPhoneNo {
    return phoneNo;
  }

  void setUserPhoneNo(String newPhoneNo) {
    if (newPhoneNo.length < 3 || newPhoneNo.length > 50) {
      //throw error
      // debugPrint('Phone number must be between 3 and 50 characters long.');
      return;
    }
    phoneNo = newPhoneNo;
  }

  String get userEventType {
    return eventType;
  }

  void setUserEventType(String newEventType) {
    if (newEventType.isEmpty == true) {
      //throw error
      // debugPrint('Event type must be filled.');
      return;
    }
    eventType = newEventType;
  }

  String get userMessage {
    return message;
  }

  void setUserMessage(String newMessage) {
    if (newMessage.isEmpty == true || newMessage.length < 50) {
      //throw error
      // debugPrint('Message must be filled and less than 50 characters long.');
      return;
    }
    message = newMessage;
  }
}
