import 'package:zyntra/features/asky_ai/data/models/resource_model.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  final String query;
  final String answer;

  final List<ResourceModel> resources;

  MessageModel({
    required this.query,
    required this.answer,
    required this.resources,
  }) : super(
         role: "asky",
         content: answer,
         date: getCurrentTimeString(),
         resources: resources,
       );

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    query: json['query'] as String? ?? '',
    answer: json['answer'] as String? ?? '',
    resources: (json['sources'] != null)
        ? List<ResourceModel>.from(json['sources'])
        : [],
  );

  Map<String, dynamic> toJson() => {
    'query': query,
    'answer': answer,
    'sources': resources,
  };
}

String getCurrentTimeString() {
  final now = DateTime.now();
  final hour = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
  final minute = now.minute.toString().padLeft(2, '0');
  final period = now.hour >= 12 ? 'PM' : 'AM';
  return '$hour:$minute $period';
}
