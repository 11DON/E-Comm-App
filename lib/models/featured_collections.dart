class FeaturedCollection {
  final String id;
  final String title;
  final String image;

  FeaturedCollection({
    required this.id,
    required this.title,
    required this.image,
  });

  static List<FeaturedCollection> featuredCollections = [
    FeaturedCollection(
      id: "1",
      title: "Smart Home Essentials",
      image: "assets/images/smart home.jpg",
    ),
    FeaturedCollection(
      id: "2",
      title: "Cozy Living Collection",
      image: "assets/images/cozy home.jpg",
    ),
  ];
}
