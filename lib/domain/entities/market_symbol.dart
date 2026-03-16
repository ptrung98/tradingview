class MarketSymbol {
  final String id;
  final String code;
  final String name;
  final String marketType; // e.g. stock, crypto, forex

  const MarketSymbol({
    required this.id,
    required this.code,
    required this.name,
    required this.marketType,
  });
}

