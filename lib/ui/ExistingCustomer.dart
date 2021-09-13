import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExistingCustomer extends StatefulWidget {

  @override
  ExistingCustomerUI createState() => ExistingCustomerUI();
}

class ExistingCustomerUI extends State<ExistingCustomer> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, ['User Created Successful', 00]);
          },
          child: Text('Existing Customer'),
        ),
      ),
    );
  }
}
