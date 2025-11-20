import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            message.text,
            style: TextStyle(color: colors.onSecondary),
          ),
        ),
        _ImageBubble(imageUrl: message.imageUrl!),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    //Size dimens of the pgone
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        imageUrl,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text("Loading image.."),
          );
        },
      ),
    );
  }
}
