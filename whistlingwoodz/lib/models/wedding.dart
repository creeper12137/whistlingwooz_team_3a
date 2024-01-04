import 'package:whistlingwoodz/models/event.dart';

class Wedding extends Event {
  Wedding(
    int uid,
    String type,
    String theme,
    String function,
    String venue,
    int guestNo,
    String budget,
    String email,
    String phoneNo,
  ) : super(uid, type, theme, function, venue, guestNo, budget, email, phoneNo);

  void submitEvent() {}
}
