import 'package:flutter/material.dart';
import 'Models/donated_food_model.dart';
import 'services/api.dart';

class DonationForm extends StatefulWidget {
  const DonationForm({Key? key}) : super(key: key);
  static String id = 'donationform';
  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {

  DonateForm donation=DonateForm();

  String? donorToken;


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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select NGO',
                  ),
                  value: donation.selectedNGO.isNotEmpty ? donation.selectedNGO : null,
                  //value: _selectedNGO,
                  items: _ngos
                      .map(
                        (ngo) => DropdownMenuItem<String>(
                      value: ngo,
                      child: Text(ngo),
                    ),
                  )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      donation.selectedNGO = value.toString();
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Donor\'s Name',
                  ),
                  onChanged: (value) {
                    donation.donorName = value.toString();
                    donation.donortoken = donorToken;
                    print(donorToken);
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                  onChanged: (value) {
                    donation.phoneNumber = value.toString();
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    donation.email = value;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Type of Food',
                  ),
                  onChanged: (value) {
                    donation.food = value.toString();
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                  ),
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
                      //print(donation);
                      Map data=donation.createJSON(donation);
                      //print(data);
                      Navigator.pop(context);
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

