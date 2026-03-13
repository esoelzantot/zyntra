import 'package:zyntra/features/article_details/domain/entities/article_analysis_entity.dart';

class ArticleAnalysisModel extends ArticleAnalysisEntity {
  final String id;
  final String question;
  final String significance;
  final List<String> fields;
  final List<String> openQuestions;
  final List<String> keyFindings;
  final List<String> implications;
  final List<String> limitations;
  final List<String> methodologies;
  final List<String> mechanisms;

  ArticleAnalysisModel({
    required this.id,
    required this.question,
    required this.significance,
    required this.fields,
    required this.openQuestions,
    required this.keyFindings,
    required this.implications,
    required this.limitations,
    required this.methodologies,
    required this.mechanisms,
  }) : super(
         id: id,
         fields: fields,
         implications: implications,
         limitations: limitations,
         keyFindings: keyFindings,
         mechanisms: mechanisms,
         methodologies: methodologies,
         openQuestions: openQuestions,
         question: question,
         significance: significance,
       );

  factory ArticleAnalysisModel.fromJson(String id, Map<String, dynamic> json) =>
      ArticleAnalysisModel(
        id: id,
        question: json['research_question'] as String? ?? '',
        significance: json['statistical_significance'] as String? ?? '',
        fields: json['relevant_fields'] != null
            ? List<String>.from(json['relevant_fields'] as List)
            : [],
        openQuestions: json['open_questions'] != null
            ? List<String>.from(json['open_questions'] as List)
            : [],
        keyFindings: json['key_findings'] != null
            ? List<String>.from(json['key_findings'] as List)
            : [],
        implications: json['implications'] != null
            ? List<String>.from(json['implications'] as List)
            : [],
        limitations: json['limitations'] != null
            ? List<String>.from(json['limitations'] as List)
            : [],
        methodologies: json['methodology'] != null
            ? List<String>.from(json['methodology'] as List)
            : [],
        mechanisms: json['mechanisms'] != null
            ? List<String>.from(json['mechanisms'] as List)
            : [],
      );

  Map<String, dynamic> toJson() => {
    'research_question': question,
    'statistical_significance': significance,
    'relevant_fields': fields,
    'open_questions': openQuestions,
    'key_findings': keyFindings,
    'implications': implications,
    'limitations': limitations,
    'methodology': methodologies,
    'mechanisms': mechanisms,
  };
}
