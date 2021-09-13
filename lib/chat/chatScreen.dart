import 'package:flutter/material.dart';

import '../AppColorCodes.dart';
import 'chat_page_body.dart';

class Chatting extends StatefulWidget {
  Chatting({Key? key}) : super(key: key);

  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: pPrimaryColor,
      titleSpacing: 0,
      title: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/bank.png'),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                ),
              )
            ],
          ),
          SizedBox(
            width: pDefaultPadding * 0.7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FIS BOL️',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1,
              ),
              Opacity(
                  opacity: 0.9,
                  child: Text('online',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)))
            ],
          ),
        ],
      ),
    );
  }
}
