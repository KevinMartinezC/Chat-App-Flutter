import 'package:chat_app/config/helpers/get_yes_no_answer.dart';
import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [];
  
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);
    notifyListeners();
    moveScrollToBottm();

    if (text.endsWith("?")) {
      await herReply();
    }
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottm();
  }

  Future<void> moveScrollToBottm() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
