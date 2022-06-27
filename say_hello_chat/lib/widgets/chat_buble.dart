import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:say_hello_chat/models/message.dart';

import '../constant.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    Key? key,
    required this.messagee
  }) : super(key: key);
 final MesageModel messagee;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding:
            const EdgeInsets.only(left: 15, top: 30, bottom: 30, right: 30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          messagee.textMessage,
          style: GoogleFonts.arvo(fontSize: 15),
        ),
      ),
    );
  }
}
class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({
    Key? key,
    required this.messagee
  }) : super(key: key);
 final MesageModel messagee;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding:
            const EdgeInsets.only(left: 15, top: 30, bottom: 30, right: 30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
          //  topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
            bottomLeft:  Radius.circular(30),
          ),
          color: kSecondryColor,
        ),
        child: Text(
          messagee.textMessage,
          style: GoogleFonts.arvo(fontSize: 15),
        ),
      ),
    );
  }
}
