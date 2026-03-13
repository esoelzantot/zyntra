abstract class ApiEndpoints {
  static const String getAllArticles = 'articles';

  static const String getNewestArticles = 'articles';

  static const String getArticleData = 'articles/{pmc_id}';

  static const String getArticleMindMap = 'articles/{pmc_id}/mindmap';

  static const String getArticleAnalysis = 'articles/{pmc_id}/research-data';

  static const String searchArticles = 'search';

  static const String askAI = 'ask';
}
