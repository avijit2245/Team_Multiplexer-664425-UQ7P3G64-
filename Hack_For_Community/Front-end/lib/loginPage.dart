import 'package:flutter/material.dart';
import 'donationForm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String id = 'login-page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'Donor Dashboard'
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  title: Text(
                    'Donate Food Now',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(context, DonationForm.id);
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                margin:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  title: Text(
                    'Track Your Donation',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    //Navigator.pushNamed(context, DonationForm.id);
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                margin:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  title: Text(
                    'Reward Section',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    //Navigator.pushNamed(context, DonationForm.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
