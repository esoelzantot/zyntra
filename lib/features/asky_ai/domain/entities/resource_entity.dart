import 'package:hive/hive.dart';

part 'resource_entity.g.dart';

@HiveType(typeId: 4)
class ResourceEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String section;
  @HiveField(3)
  final num score;

  const ResourceEntity({
    required this.id,
    required this.title,
    required this.section,
    required this.score,
  });
}
