import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
  
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
          },
          icon: Icon(Icons.send_outlined),
        ),
      ),
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
      },
      onChanged: (value) => {
        print("on changed $value")
      },
      onTapOutside: (event) {
        focusNode.unfocus();
      },
    );
  }
}
