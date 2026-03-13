import 'package:hive/hive.dart';
import 'package:zyntra/features/asky_ai/domain/entities/message_entity.dart';

part 'thread_entity.g.dart';

@HiveType(typeId: 5)
class ThreadEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final List<MessageEntity> messages;

  const ThreadEntity({
    required this.id,
    required this.title,
    required this.date,
    required this.messages,
  });

  ThreadEntity copyWith({
    String? id,
    String? title,
    String? date,
    List<MessageEntity>? messages,
  }) {
    return ThreadEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      messages: messages ?? this.messages,
    );
  }
}
