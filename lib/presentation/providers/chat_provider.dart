import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {

  List<Message> messageList = [
    Message(text: "Hi, my friend", fromWho: FromWho.mine),
    Message(text: "How are you?", fromWho: FromWho.hers)
  ];

  Future<void> sendMessage(String text) async {
    // TODO no yet implemented 
  }
}