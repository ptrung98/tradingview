class AppConfig {
  final String baseUrl;
  final String? apiKey;
  final bool embedded;
  final bool enableMarket;
  final bool enableTrade;
  final bool enablePortfolio;

  const AppConfig({
    required this.baseUrl,
    this.apiKey,
    this.embedded = false,
    this.enableMarket = true,
    this.enableTrade = true,
    this.enablePortfolio = true,
  });
}

