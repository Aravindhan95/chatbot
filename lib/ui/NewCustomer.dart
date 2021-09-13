import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewCustomer extends StatefulWidget {
  @override
  NewCustomerUI createState() => NewCustomerUI();
}

class NewCustomerUI extends State<NewCustomer> {

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
          child: Text('New Customer Created'),
        ),
      ),
    );
  }
}
