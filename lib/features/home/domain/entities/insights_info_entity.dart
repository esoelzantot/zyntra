import 'benefit_entity.dart';

class InsightsInfoEntity {
  final String title;
  final String description;
  final List<BenefitEntity> benefits;

  const InsightsInfoEntity({
    required this.title,
    required this.description,
    required this.benefits,
  });
}
