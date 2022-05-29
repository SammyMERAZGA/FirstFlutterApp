// @dart=2.9
import 'package:formation/recipe.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class RecipeBox {
  static final RecipeBox instance = RecipeBox();
  static Box box;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(RecipeAdapter());
    RecipeBox.box = await Hive.openBox('recipeBox');
    var values = box.values;
    if (values == null || values.isEmpty) {
      RecipeBox.box.putAll(
          Map.fromIterable(recipes, key: (e) => e.key(), value: (e) => e));
    }
  }

  static final List<Recipe> recipes = [
    Recipe(
        "Crêpe française",
        "Par Sammy Merazga",
        "https://img.cuisineaz.com/660x660/2015/01/29/i113699-photo-de-crepe-facile.jpeg",
        "Pour 6 personnes : \n\n 30g Beurre fondu \n\n 250g Farine \n\n 1 pincée Sel \n\n 30g Sucre en poudre \n\n 4 oeufs \n\n 50cl Lait \n\n 3cl Huile d'arachide \n\n Faites fondre le beurre au micro-ondes. \n\n Versez dans un saladier la farine, le sel, le sucre et formez un puits au centre. \n\n Mélangez les œufs battus, le lait et le beurre puis versez ce mélange dans la farine. Mélangez au fouet en commençant par le centre puis en allant de plus en plus vers les bords jusqu'à bien mêler tous les ingrédients. Laisser reposer la pâte pendant 1 h. \n\n Badigeonnez d'huile une poêle antiadhésive chaude et versez-y une louche de pâte à crêpe. Laissez cuire pendant environ 2 min de chaque côté. Recommencez autant de fois que nécessaire pour finir toute la pâte.",
        false,
        50)
  ];
}
