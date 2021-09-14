import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ChequeProcessing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cheque Processing"),
      ),
      body: ChequeProcessingMainUI(),
    );
  }
}

class ChequeProcessingMainUI extends StatefulWidget {
  @override
  ChequeProcessingUI createState() {
    return ChequeProcessingUI();
  }
}

class ChequeProcessingUI extends State<ChequeProcessingMainUI> {
  late TextEditingController amountController;
  late TextEditingController dateOfIssueController;
  late TextEditingController remitterNameController;

  bool panVisible = false;
  bool aadhaarVisible = false;

  String panPath = "";
  String aadhaarPath = "";

  @override
  void initState() {
    amountController = new TextEditingController();
    dateOfIssueController = new TextEditingController();
    remitterNameController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                      enabled: false,
                      textInputAction: TextInputAction.go,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                          labelText: "Cheque Front Side"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: Visibility(
                      child: Text(
                        "$panPath.jpg",
                        style: TextStyle(fontSize: 10.0),
                      ),
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
                  onPressed: () async {
                    Map<Permission, PermissionStatus> statuses = await [
                      Permission.camera,
                      Permission.storage,
                    ].request();

                    print("statuses $statuses");

                    var storageStatus = await Permission.storage.status;
                    var cameraStatus = await Permission.camera.status;
                    print("storageStatus $storageStatus");
                    print("cameraStatus $cameraStatus");

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
                              if (cameraStatus.isGranted) {
                                Navigator.of(ctx).pop();
                                final ImagePicker _picker = ImagePicker();
                                final XFile? photo = await _picker.pickImage(
                                    source: ImageSource.camera);
                                print("photo " + photo!.name.toString());
                                setState(() {
                                  panPath = photo.name.toString();
                                  panPath =
                                      panPath.characters.take(9).toString();
                                  panVisible = true;
                                });
                              } else {
                                Navigator.of(ctx).pop();
                              }
                            },
                            child: Text("Camera"),
                          ),
                          TextButton(
                            onPressed: () async {
                              if (storageStatus.isGranted) {
                                Navigator.of(ctx).pop();
                                final ImagePicker _picker = ImagePicker();
                                final XFile? photo = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                print("photo " + photo!.name.toString());
                                setState(() {
                                  panPath = photo.name.toString();
                                  panPath =
                                      panPath.characters.take(9).toString();
                                  panVisible = true;
                                });
                              } else {
                                Navigator.of(ctx).pop();
                              }
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
                      enabled: false,
                      textInputAction: TextInputAction.go,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                          labelText: "Cheque Back Side"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: Visibility(
                      child: Text(
                        "$aadhaarPath.jpg",
                        style: TextStyle(fontSize: 10.0),
                      ),
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
                  onPressed: () async {
                    Map<Permission, PermissionStatus> statuses = await [
                      Permission.camera,
                      Permission.storage,
                    ].request();

                    print("statuses $statuses");

                    var storageStatus = await Permission.storage.status;
                    var cameraStatus = await Permission.camera.status;
                    print("storageStatus $storageStatus");
                    print("cameraStatus $cameraStatus");

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
                              if (cameraStatus.isGranted) {
                                Navigator.of(ctx).pop();
                                final ImagePicker _picker = ImagePicker();
                                final XFile? photo = await _picker.pickImage(
                                    source: ImageSource.camera);
                                print("photo " + photo!.name.toString());
                                setState(() {
                                  aadhaarPath = photo.name.toString();
                                  aadhaarPath =
                                      aadhaarPath.characters.take(9).toString();
                                  aadhaarVisible = true;
                                });
                              } else {
                                Navigator.of(ctx).pop();
                              }
                            },
                            child: Text("Camera"),
                          ),
                          TextButton(
                            onPressed: () async {
                              if (storageStatus.isGranted) {
                                Navigator.of(ctx).pop();
                                final ImagePicker _picker = ImagePicker();
                                final XFile? photo = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                print("photo " + photo!.name.toString());
                                setState(() {
                                  aadhaarPath = photo.name.toString();
                                  aadhaarPath =
                                      aadhaarPath.characters.take(9).toString();
                                  aadhaarVisible = true;
                                });
                              } else {
                                Navigator.of(ctx).pop();
                              }
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
                  labelText: "Amount"),
              controller: amountController,
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
                  labelText: "Date of Issue"),
              controller: dateOfIssueController,
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
                  labelText: "Remitter Name"),
              controller: remitterNameController,
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
                Navigator.pop(context, ['Cheque submitted Successful', 00]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
