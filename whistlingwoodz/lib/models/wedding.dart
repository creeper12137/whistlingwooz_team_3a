import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Function to convert Wedding object to a Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'type': type,
      'theme': theme,
      'function': function,
      'venue': venue,
      'guestNo': guestNo,
      'budget': budget,
      'email': email,
      'phoneNo': phoneNo,
    };
  }

  // Function to submit the event to Firestore
  Future<void> submitEvent() async {
    try {
      // Create a reference to the Firestore collection
      CollectionReference events = FirebaseFirestore.instance.collection('events');

      // Convert the Wedding object to a Map
      Map<String, dynamic> eventData = toMap();

      // Add the data to Firestore
      await events.add(eventData);

      print('Event submitted successfully!');
    } catch (e) {
      print('Error submitting event: $e');
    }
  }
}

