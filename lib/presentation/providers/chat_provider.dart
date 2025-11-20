import 'package:chat_app/config/helpers/get_yes_no_answer.dart';
import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: "Hi, my friend", fromWho: FromWho.mine),
    Message(text: "How are you?", fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);
    if (text.endsWith("?")) {
      herReply();
    }
    notifyListeners();
    moveScrollToBottm();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
  }

  Future<void> moveScrollToBottm() async {
    await Future.delayed(const Duration(microseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(microseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
