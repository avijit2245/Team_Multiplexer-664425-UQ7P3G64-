import 'package:flutter/material.dart';
import 'donation_form.dart';
import 'TrackingPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/api.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String id = 'home-page';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40),
                    Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        title:const  Text(
                          'Donate Now',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Request for food donation pickup from your home',
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.pushNamed(context, DonationForm.id);
                        },
                      ),
                    ),
                    Card(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        title: Text(
                          'Track your Donations',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Track your current donation.',
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => FoodDonationTrackingPage(),
                            settings: RouteSettings(arguments: {'step':'0'}),
                          ),);
                        },
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        );

  }
}

