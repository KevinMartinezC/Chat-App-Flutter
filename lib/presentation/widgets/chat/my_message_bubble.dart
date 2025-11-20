import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color:colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            message.text,
            style: TextStyle(color: colors.onPrimary),
          ),
        ),
      ],
    );
  }
}
