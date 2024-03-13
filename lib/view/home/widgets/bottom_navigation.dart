import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/view/home/applications/application_screen.dart';
import 'package:student_app/view/home/chat/chat_screen.dart';
import 'package:student_app/view/home/explore/explore_screen.dart';
import 'package:student_app/view/home/meet/meet_screen.dart';
import 'package:student_app/view/home/profile/profile_screen.dart';

import '../../../controller/home_controller.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  @override
  void initState() {
    
    super.initState();
  }

  final pages= [

    //explore screen
    ExploreScreen(),
    // chat screen
  //  const ChatScreen(),
  //   // meet screen
  //  const MeetScreen(),
  //   // applications screen
  // const  ApplicationsScreen(),

    //profile screen
  const  ProfileScreen()





  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
      
        body: pages[homeController.pageIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.black),

          currentIndex: homeController.pageIndex.value,
       
          onTap: (index){
            homeController.pageIndex.value=index;
          },
          
          items:const  [
            
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,),label: 'Home'),
          // BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_outlined,color: Colors.black,),label: 'Chat'),
          // BottomNavigationBarItem(icon: Icon(Icons.video_chat_outlined,color: Colors.black,),label: 'Meet'),
          // BottomNavigationBarItem(icon: Icon(Icons.sticky_note_2_outlined,color: Colors.black,),label: 'Applications'),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black,),label: 'Profile'),
          
          
          ]),
      
      
      
      
      
      ),
    );
  }
}