// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whistlingwoodz/Firestore_get_userID/get_userID.dart';
import 'package:whistlingwoodz/screens/landing_page_screen.dart';
import 'package:whistlingwoodz/screens/match_making_screen.dart';
import 'package:whistlingwoodz/widgets/app_bar_widget.dart';
import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';
import 'package:whistlingwoodz/screens/wedding_celebrations_screen.dart';
import 'package:whistlingwoodz/screens/corporate_events_screen.dart';
import 'package:whistlingwoodz/screens/parties_screen.dart';
import 'package:whistlingwoodz/screens/services_screen.dart';
import 'package:whistlingwoodz/screens/survey_form_screen.dart';
import 'package:whistlingwoodz/screens/photo_gallery_screen.dart';
import 'package:whistlingwoodz/screens/inquiry_form_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MainScreen extends StatefulWidget {
  const MainScreen(
      {super.key, required this.data, required this.selectedIndex});
  final bool data;
  final int selectedIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  
  bool isLogin = false;
  // Firestore document IDs
  List<String> docIDs =[];
  // get all users

  Future getDocId() async{
    await FirebaseFirestore.instance.collection('users').get().then(
        (snapshot) => snapshot.docs.forEach(
          (document){ 
            print(document.reference);
            docIDs.add(document.reference.id);
          }
        ),
      );
  }

 
  @override
  Widget build(BuildContext context) {
    pageSelection(){
                if (widget.selectedIndex == 0) {
                  return const Wedding(data: false);
                } else if (widget.selectedIndex == 1) {
                  return const Corporate(data: false);
                } else if (widget.selectedIndex == 2) {
                  return const Party(data: false);
                } else if (widget.selectedIndex == 3) {
                  return const Services(data: false);
                } else if (widget.selectedIndex == 4) {
                  return const MatchMaking();
                } else if (widget.selectedIndex == 5) {
                  return const Galleries();
                } else if (widget.selectedIndex == 6) {
                  return const SurveyForm(data: false);
                } else if (widget.selectedIndex == 7) {
                  return const LandingPage();
                } else if (widget.selectedIndex == 8) {
                  return const InquiryForm(data: false);
                } else{
                  return const LandingPage();
                }
    }
    
    Widget currentPage() {
      if(widget.data){
        final currentUser = FirebaseAuth.instance.currentUser!;
        var users = FirebaseFirestore.instance.collection('users');
        
        for(var index = 0; index<docIDs.length; index++){
          return FutureBuilder<DocumentSnapshot>(
            future: users.doc(docIDs[index]).get(),
            builder: (context, snapshot) {
                if (snapshot.data != null && snapshot.data!.exists) {
                  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                  String userData = data['uid'];
                  if(currentUser.uid == userData){
                    String isAdminText = data['isAdmin'].toString();
                    if(isAdminText == 'true'){
                      return Text('$isAdminText');
                    }
                  }
                }
                return pageSelection();
              
            }
          );
        }
      }
      return pageSelection();
    }
   
   getDocId();

    return Scaffold(
      appBar: AppBarPage(data: widget.data),
      body: currentPage(),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
