class Recipe {
  String title;
  String user;
  String imageUrl;
  String description;
  bool isFavorite;
  int favoriteCount;

  Recipe({
    required this.title,
    required this.user,
    required this.imageUrl,
    required this.description,
    required this.isFavorite,
    required this.favoriteCount
  });
}