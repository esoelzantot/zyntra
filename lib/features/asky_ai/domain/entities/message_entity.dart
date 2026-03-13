import 'package:hive/hive.dart';
import 'package:zyntra/features/asky_ai/domain/entities/resource_entity.dart';

part 'message_entity.g.dart';

@HiveType(typeId: 3)
class MessageEntity {
  @HiveField(0)
  final String role;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final List<ResourceEntity> resources;

  const MessageEntity({
    required this.role,
    required this.content,
    required this.date,
    required this.resources,
  });
}
