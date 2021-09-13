import 'dart:ffi';
import 'dart:math';

import 'package:chatbotui/models/messages_model.dart';
import 'package:chatbotui/ui/ExistingCustomer.dart';
import 'package:chatbotui/ui/NewCustomer.dart';
import 'package:flutter/material.dart';

import '../AppColorCodes.dart';

List<dynamic> userSearchItems = [];

class Body extends StatefulWidget {
  @override
  BodyUI createState() => BodyUI();
}

class BodyUI extends State<Body> {
  //const Body({Key key}) : super(key: key);

  var val;

  List<String> customerType = [];
  List<String> serviceType = [];

  @override
  void initState() {
    super.initState();
    userSearchItems.clear();
    customerType.clear();
    serviceType.clear();

    for (var i = 0; i < chatMessages.length; i++) {
      userSearchItems.add(chatMessages[i]);
    }

    customerType.add("New Customer");
    customerType.add("Existing Customer");

    serviceType.add("Check Processing");
    serviceType.add("Track Check Application");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: pDefaultPadding),
            child: ListView.builder(
                itemCount: userSearchItems.length,
                itemBuilder: (context, index) =>
                    // Messages(message: userSearchItems[index])
                    Padding(
                      padding:
                          const EdgeInsets.only(top: pDefaultPadding * 0.9),
                      child: Row(
                        mainAxisAlignment: userSearchItems[index].isSender
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (!userSearchItems[index].isSender) ...[
                            CircleAvatar(
                              radius: 13,
                              backgroundImage: AssetImage('assets/bank.png'),
                            )
                          ],
                          SizedBox(
                            width: pDefaultPadding / 2,
                          ),
                          if (userSearchItems[index]
                              .text
                              .startsWith("Select")) ...[
                            Container(
                                // margin: EdgeInsets.only(top:pDefaultPadding),
                                width: MediaQuery.of(context).size.width * 0.80,
                                height: 150.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: pDefaultPadding * 0.5,
                                    vertical: pDefaultPadding / 2),
                                decoration: BoxDecoration(
                                    color: userSearchItems[index].isSender
                                        ? pSecondaryColor.withOpacity(0.9)
                                        : pSecondaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(35)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5.0),
                                      child: Text(
                                        "Please Select your option",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 100.0,
                                      child: ListView.builder(
                                        itemCount: 2,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Column(
                                            children: <Widget>[
                                              InkWell(
                                                child: ListTile(
                                                  dense: true,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 0.0,
                                                          right: 0.0),
                                                  title: Transform.translate(
                                                    offset: Offset(3, -3),
                                                    child: Text(
                                                      customerType[index]
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  if (index == 0) {
                                                    userSearchItems.add(
                                                      ChatMessage(
                                                        text: "New Customer",
                                                        messageType:
                                                            ChatMessageType
                                                                .text,
                                                        messageStatus:
                                                            MessageStatus
                                                                .viewed,
                                                        isSender: true,
                                                      ),
                                                    );
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 500),
                                                        () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                NewCustomer()),
                                                      ).then((value) {
                                                        print(
                                                            "newCustomerResponse ${value[1]}");
                                                        if (value[1] == 00) {
                                                          setState(() {
                                                            userSearchItems.add(
                                                              ChatMessage(
                                                                text: "Your Application submitted successful",
                                                                messageType: ChatMessageType.text,
                                                                messageStatus: MessageStatus.viewed,
                                                                isSender: false,
                                                              ),
                                                            );
                                                            Future.delayed(
                                                                new Duration(
                                                                    milliseconds:
                                                                        500),
                                                                () {
                                                              setState(() {
                                                                userSearchItems
                                                                    .add(
                                                                  ChatMessage(
                                                                    text:
                                                                        "Your Application Reference ID: ${get6DigitNumber()}",
                                                                    messageType:
                                                                        ChatMessageType
                                                                            .text,
                                                                    messageStatus:
                                                                        MessageStatus
                                                                            .viewed,
                                                                    isSender:
                                                                        false,
                                                                  ),
                                                                );
                                                              });
                                                            });
                                                          });
                                                        }
                                                      });
                                                    });
                                                  } else {
                                                    setState(() {
                                                      userSearchItems.add(
                                                        ChatMessage(
                                                          text: "Existing Customer",
                                                          messageType: ChatMessageType.text,
                                                          messageStatus:
                                                          MessageStatus.viewed,
                                                          isSender: true,
                                                        ),
                                                      );
                                                      Future.delayed(
                                                          const Duration(milliseconds: 500),
                                                              () async {
                                                            await Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      ExistingCustomer()),
                                                            ).then((value) {
                                                              if (value[1] == 00) {
                                                                setState(() {
                                                                  userSearchItems.add(
                                                                    ChatMessage(
                                                                      text: "Login Successful",
                                                                      messageType: ChatMessageType.text,
                                                                      messageStatus: MessageStatus.viewed,
                                                                      isSender: false,
                                                                    ),
                                                                  );
                                                                  Future.delayed(
                                                                      new Duration(
                                                                          milliseconds:
                                                                          500),
                                                                          () {
                                                                        setState(() {
                                                                          userSearchItems
                                                                              .add(
                                                                            ChatMessage(
                                                                              text:
                                                                              "Available Services",
                                                                              messageType:
                                                                              ChatMessageType
                                                                                  .text,
                                                                              messageStatus:
                                                                              MessageStatus
                                                                                  .viewed,
                                                                              isSender:
                                                                              false,
                                                                            ),
                                                                          );
                                                                        });
                                                                      });
                                                                });
                                                              }
                                                            });
                                                          });
                                                    });
                                                  }
                                                },
                                              ),
                                              Divider(),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                          ] else if(userSearchItems[index]
                              .text
                              .startsWith("Available")) ...[
                            Container(
                              // margin: EdgeInsets.only(top:pDefaultPadding),
                                width: MediaQuery.of(context).size.width * 0.80,
                                height: 150.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: pDefaultPadding * 0.5,
                                    vertical: pDefaultPadding / 2),
                                decoration: BoxDecoration(
                                    color: userSearchItems[index].isSender
                                        ? pSecondaryColor.withOpacity(0.9)
                                        : pSecondaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(35)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5.0),
                                      child: Text(
                                        "Available Services",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 100.0,
                                      child: ListView.builder(
                                        itemCount: 2,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Column(
                                            children: <Widget>[
                                              InkWell(
                                                child: ListTile(
                                                  dense: true,
                                                  contentPadding:
                                                  EdgeInsets.only(
                                                      left: 0.0,
                                                      right: 0.0),
                                                  title: Transform.translate(
                                                    offset: Offset(3, -3),
                                                    child: Text(
                                                      serviceType[index]
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {

                                                },
                                              ),
                                              Divider(),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                          ] else ...[
                            Container(
                                // margin: EdgeInsets.only(top:pDefaultPadding),

                                padding: EdgeInsets.symmetric(
                                    horizontal: pDefaultPadding * 0.5,
                                    vertical: pDefaultPadding / 2),
                                decoration: BoxDecoration(
                                    color: userSearchItems[index].isSender
                                        ? pSecondaryColor.withOpacity(0.9)
                                        : pSecondaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(35)),
                                child: Text(
                                  userSearchItems[index].text,
                                  style: TextStyle(
                                    color: userSearchItems[index].isSender
                                        ? Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                          if (userSearchItems[index].isSender)
                            MessageTick(
                                status: userSearchItems[index].messageStatus)
                        ],
                      ),
                    )),
          ),
        ),
        chatTextField(context),
      ],
    );
  }

  Container chatTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: pDefaultPadding, vertical: pDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 40,
              color: Colors.grey.withOpacity(0.2))
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Icon(Icons.mic, color: pSecondaryColor),
            SizedBox(
              width: pDefaultPadding * 0.1,
            ),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: pPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: pDefaultPadding * 0.01,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 6.0,
                        ),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 2,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: '  Type your message',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.green,
              ),
              onPressed: () {
                setState(
                  () {
                    userSearchItems.add(
                      ChatMessage(
                        text: "New Message Added",
                        messageType: ChatMessageType.text,
                        messageStatus: MessageStatus.viewed,
                        isSender: false,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*class Messages extends StatefulWidget {
  const Messages({
    Key? key,
    required this.message,
  }) : super(key: key);
  final ChatMessage message;

  @override
  MessagesUI createState() => MessagesUI(message);
}

class MessagesUI extends State<Messages> {
  MessagesUI(this.message);

  final ChatMessage message;

  var val;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: pDefaultPadding * 0.9),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 13,
              backgroundImage: AssetImage('assets/bank.png'),
            )
          ],
          SizedBox(
            width: pDefaultPadding / 2,
          ),
          if (message.text.startsWith("Select")) ...[
            Container(
              // margin: EdgeInsets.only(top:pDefaultPadding),
              width: MediaQuery.of(context).size.width * 0.80,
              padding: EdgeInsets.symmetric(
                  horizontal: pDefaultPadding * 0.5,
                  vertical: pDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: message.isSender
                      ? pSecondaryColor.withOpacity(0.9)
                      : pSecondaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(35)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    title: Transform.translate(
                      offset: Offset(-16, 0),
                      child: Text(
                        'New Customer',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    leading: Radio(
                      value: 1,
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value;
                          if (value == 1) {
                            userSearchItems.add(
                              ChatMessage(
                                text: "New Customer",
                                messageType: ChatMessageType.text,
                                messageStatus: MessageStatus.viewed,
                                isSender: true,
                              ),
                            );
                          }
                        });
                      },
                      activeColor: Colors.green,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    title: Transform.translate(
                      offset: Offset(-16, 0),
                      child: Text(
                        'Existing Customer',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    leading: Radio(
                      value: 2,
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          val = value;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            Container(
                // margin: EdgeInsets.only(top:pDefaultPadding),

                padding: EdgeInsets.symmetric(
                    horizontal: pDefaultPadding * 0.5,
                    vertical: pDefaultPadding / 2),
                decoration: BoxDecoration(
                    color: message.isSender
                        ? pSecondaryColor.withOpacity(0.9)
                        : pSecondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(35)),
                child: Text(
                  message.text,
                  style: TextStyle(
                      color: message.isSender
                          ? Theme.of(context).textTheme.bodyText1!.color
                          : Theme.of(context).textTheme.bodyText1!.color),
                )),
          ],
          if (message.isSender) MessageTick(status: message.messageStatus)
        ],
      ),
    );
  }
}*/

class MessageTick extends StatelessWidget {
  final MessageStatus? status;

  const MessageTick({Key? key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return pErrorColor;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.3);
        case MessageStatus.viewed:
          return pPrimaryColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: pDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}

String get6DigitNumber() {
  Random random = Random();
  String number = '';
  for (int i = 0; i < 8; i++) {
    number = number + random.nextInt(9).toString();
  }
  return number;
}
