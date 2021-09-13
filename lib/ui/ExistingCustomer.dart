import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExistingCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Existing Customer"),
      ),
      body: ExistingCustomerMain(),
    );
  }
}

class ExistingCustomerMain extends StatefulWidget {
  @override
  ExistingCustomerUI createState() {
    return ExistingCustomerUI();
  }
}

class ExistingCustomerUI extends State<ExistingCustomerMain> {
  late TextEditingController customerIDController;
  late TextEditingController passwordController;

  @override
  void initState() {
    customerIDController = new TextEditingController();
    passwordController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.90,
        height: 380.0,
        child: Card(
          elevation: 8.0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  "Customer Login",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: TextField(
                  textInputAction: TextInputAction.go,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 2.0),
                      ),
                      labelText: "Customer ID"),
                  controller: customerIDController,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: TextField(
                  textInputAction: TextInputAction.go,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 2.0),
                      ),
                      labelText: "Password"),
                  controller: passwordController,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: EdgeInsets.all(16.0),
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50.0,
                margin: EdgeInsets.all(16.0),
                child: FlatButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context, ['Login Successful', 00]);
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
