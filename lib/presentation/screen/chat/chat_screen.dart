import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/presentation/providers/chat_provider.dart';
import 'package:chat_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:chat_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://pbs.twimg.com/profile_images/588353819312054274/1FN4L8aG_400x400.jpg',
            ),
          ),
        ),
        title: const Text("Chat Screen"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                 final message = chatProvider.messageList[index];

                 return (message.fromWho == FromWho.hers) 
                 ? HerMessageBubble() 
                 : MyMessageBubble(message: message);
                },
              ),
            ),
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
