import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:say_hello_chat/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/message.dart';
import '../widgets/chat_buble.dart';

class ChatScreen extends StatelessWidget {
  static String id = "ChatScreen";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference Messages =
      FirebaseFirestore.instance.collection(KMessagesCollection);
  TextEditingController controllerr = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
  var email=  ModalRoute.of(context)!.settings.arguments;

    return SafeArea(
      child: StreamBuilder<QuerySnapshot>(
        stream: Messages.orderBy('createdAt', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MesageModel> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList
                  .add(MesageModel.fromJson(snapshot.data!.docs[i].data()!));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/q3.png',
                      height: 50,
                    ),
                    Text(
                      " Chat ",
                      style: GoogleFonts.alikeAngular(
                          fontSize: 25, color: Colors.black87),
                    )
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return  messagesList[index].id== email? ChatBuble(messagee: messagesList[index])
                        :ChatBubleForFriend(messagee:messagesList[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: controllerr,
                      // onSubmitted: (value) {
                      //   Messages.add(
                      //       {'Messages': value, "createdAt": DateTime.now()});
                      //   controllerr.clear();
                      // },
                      decoration: InputDecoration(
                          hintText: "Send Message",
                          suffixIcon: IconButton(
                            onPressed: () {
                              Messages.add({
                                'Messages': controllerr.text,
                                "createdAt": DateTime.now(),
                                'id':email
                              });
                              controllerr.clear();
                              _controller.animateTo(
                                  _controller.position.maxScrollExtent,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.bounceIn);
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.teal,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Loading....",
                      style: TextStyle(fontSize: 20),
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
