import 'package:whistlingwoodz/models/event.dart';

class Wedding extends Event {
  Wedding({
    required String id,
    required String type,
    required String theme,
    required String function,
    required String venue,
    required String guestNo,
    required String budget,
    required String email,
    required String phoneNo,
  }) : super(
            id: id,
            type: type,
            theme: theme,
            function: function,
            venue: venue,
            guestNo: guestNo,
            budget: budget,
            email: email,
            phoneNo: phoneNo);

  @override
  toJson() {
    return {
      'uid': id,
      'type': 'Wedding',
      'theme': theme,
      'function': function,
      'venue': venue,
      'guestNo': guestNo,
      'budget': budget,
      'email': email,
      'phoneNo': phoneNo,
    };
  }
}
