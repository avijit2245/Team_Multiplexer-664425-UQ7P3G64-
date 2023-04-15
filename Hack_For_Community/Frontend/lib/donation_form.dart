import 'package:flutter/material.dart';
import 'models/donated_food_model.dart';
import 'services/api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class DonationForm extends StatefulWidget {
  const DonationForm({Key? key}) : super(key: key);
  static String id = 'donation-form';
  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {

    Donation donation=Donation();


    final _formKey = GlobalKey<FormState>();

    List<String> _ngos = [
      'NGO A',
      'NGO B',
      'NGO C',
      'NGO D',
    ];

    @override
  void initState() {
    super.initState();

  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Donation Request Form'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name of Food',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter name of food';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      donation.food = value.toString();
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Quantity';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      donation.quantity = value.toString();
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Best Before (in hours)',
                    ),
                    onChanged: (value) {
                      donation.bestbefore = value.toString();
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Address',
                    ),
                    onChanged: (value) {
                      //print(value);
                      donation.address = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        //print(donation);
                        Map data=donation.createJSON(donation);
                        //print(data);
                        Api.createDonation(data);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Donate'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

  }

