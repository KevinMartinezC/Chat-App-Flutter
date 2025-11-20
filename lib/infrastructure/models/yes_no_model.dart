import 'package:chat_app/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  //Factory is to create a new instance
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json['answer'],
    forced: json['forced'],
    image: json['image'],
  );

  Message toMessageModel() =>
      Message(text: answer, fromWho: FromWho.hers, imageUrl: image);
}
