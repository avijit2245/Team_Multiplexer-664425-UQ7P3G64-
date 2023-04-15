import 'dart:convert';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'donation_form.dart';
import 'TrackingPage.dart';
import 'volunteer_dashboard/volenteer_dashboard.dart';
import 'package:food_donation_app/volunteer_dashboard/RequestPage.dart';

//final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

void main() async{


  runApp(
    MaterialApp(
      //navigatorKey: navigatorKey,
      initialRoute:Home.id,
      routes: {
        Home.id: (context)=> Home(),
        DonationForm.id: (context)=>DonationForm(),
        FoodDonationTrackingPage.id: (context)=>FoodDonationTrackingPage(),
        VolunteerDashboard.id:(context)=>VolunteerDashboard(),
        FoodDonationTrackingPage.id :(context)=>FoodDonationTrackingPage(),
        RequestPage.id : (context)=>RequestPage(),
      },
    ),
  );

}

