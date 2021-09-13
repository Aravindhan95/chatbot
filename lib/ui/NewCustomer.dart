import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Customer"),
      ),
      body: NewCustomerMainUI(),
    );
  }
}

class NewCustomerMainUI extends StatefulWidget {
  @override
  NewCustomerUI createState() {
    return NewCustomerUI();
  }
}

class NewCustomerUI extends State<NewCustomerMainUI> {
  late TextEditingController customerNameController;
  late TextEditingController fatherNameController;
  late TextEditingController dobController;
  late TextEditingController permanentAddressController;
  late TextEditingController communicationAddressController;
  late TextEditingController panController;
  late TextEditingController aadhaarController;
  late TextEditingController OccupationController;
  late TextEditingController totalIncomeController;

  bool panVisible = false;
  bool aadhaarVisible = false;

  String panPath = "";
  String aadhaarPath = "";

  @override
  void initState() {
    customerNameController = new TextEditingController();
    fatherNameController = new TextEditingController();
    dobController = new TextEditingController();
    permanentAddressController = new TextEditingController();
    communicationAddressController = new TextEditingController();
    panController = new TextEditingController();
    aadhaarController = new TextEditingController();
    OccupationController = new TextEditingController();
    totalIncomeController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                  labelText: "Customer Name"),
              controller: customerNameController,
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
                  labelText: "Father Name"),
              controller: fatherNameController,
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
                  labelText: "Date of Birth"),
              controller: dobController,
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
                  labelText: "Permanent Address"),
              controller: permanentAddressController,
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
                  labelText: "Communication Address"),
              controller: communicationAddressController,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.78,
                    margin: EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      left: 16.0,
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      textInputAction: TextInputAction.go,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                          labelText: "PAN"),
                      controller: panController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: Visibility(
                      child: Text("$panPath",style: TextStyle(fontSize: 10.0),),
                      visible: panVisible,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16.0,
                  bottom: 24.0,
                  right: 16.0,
                ),
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    size: 40,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Please Select"),
                        content: Text("Image Selection from?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("cancel"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(ctx).pop();
                              final ImagePicker _picker = ImagePicker();
                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.camera);
                              print("photo " + photo!.name.toString());
                              setState(() {
                                panPath = photo.name.toString();
                                panVisible = true;
                              });
                            },
                            child: Text("Camera"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(ctx).pop();
                              final ImagePicker _picker = ImagePicker();
                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              print("photo " + photo!.name.toString());
                              setState(() {
                                panPath = photo.name.toString();
                                panVisible = true;
                              });
                            },
                            child: Text("Device"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.78,
                    margin: EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      left: 16.0,
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      textInputAction: TextInputAction.go,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                          labelText: "AADHAAR"),
                      controller: panController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: Visibility(
                      child: Text("$aadhaarPath",style: TextStyle(fontSize: 10.0),),
                      visible: aadhaarVisible,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16.0,
                  bottom: 24.0,
                  right: 16.0,
                ),
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    size: 40,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Please Select"),
                        content: Text("Image Selection from?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("cancel"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(ctx).pop();
                              final ImagePicker _picker = ImagePicker();
                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.camera);
                              print("photo " + photo!.name.toString());
                              setState(() {
                                aadhaarPath = photo.name.toString();
                                aadhaarVisible = true;
                              });
                            },
                            child: Text("Camera"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(ctx).pop();
                              final ImagePicker _picker = ImagePicker();
                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              print("photo " + photo!.name.toString());
                              setState(() {
                                aadhaarPath = photo.name.toString();
                                aadhaarVisible = true;
                              });
                            },
                            child: Text("Device"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
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
                  labelText: "OCCUPATION"),
              controller: OccupationController,
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
                  labelText: "GROSS TOTAL INCOME"),
              controller: totalIncomeController,
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
                Navigator.pop(context, ['User Created Successful', 00]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
