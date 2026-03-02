import 'package:zyntra/core/utils/app_assets.dart';

class InsightInfoData {
  static String mainTitle =
      "The Definitive NASA Research Hub: Intelligent Data Synthesis & AI Insights";

  static String description =
      'Empowering researchers and space enthusiasts with direct access to NASA’s official scientific archive. Our platform leverages the "Asky" AI model—specifically grounded in peer-reviewed aerospace data—to transform complex papers into interactive mindmaps, evidence-based summaries, and multidimensional pros-and-cons insights.';

  static List<FeatureInfo> features = [
    FeatureInfo(
      title: 'Official NASA Repository',
      description:
          'Direct API-integrated access to peer-reviewed research and raw telemetry data',
      category: 'Verified Knowledge Access',
      imageUrl: AppAssets.feature1,
    ),

    FeatureInfo(
      title: 'Specialized Research AI',
      description:
          'Context-aware AI assistant providing cited answers based exclusively on scientific papers',
      category: 'Advanced Semantic Reasoning',
      imageUrl: AppAssets.feature2,
    ),

    FeatureInfo(
      title: 'Interactive Mindmap Architect',
      description:
          'Automated visual mapping of complex methodologies and conceptual relationships',
      category: 'Structural Information Design',
      imageUrl: AppAssets.feature3,
    ),

    FeatureInfo(
      title: 'Multidimensional Paper Insights',
      description:
          'AI-driven synthesis of conclusions, experimental pros/cons, and future research gaps',
      category: 'Objective Data Evaluation',
      imageUrl: AppAssets.feature4,
    ),
  ];
}

class FeatureInfo {
  final String title;
  final String description;

  final String category;
  final String imageUrl;

  FeatureInfo({
    required this.title,
    required this.description,
    required this.category,
    required this.imageUrl,
  });
}
