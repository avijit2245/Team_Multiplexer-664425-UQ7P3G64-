import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'donationForm.dart';

void main() {
  runApp(
    MaterialApp(
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id : (context) => LoginPage(),
          DonationForm.id : (context) => DonationForm(),
        }
    ),
  );
}





