import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:formation/recipe.dart';
import 'package:formation/recipeScreen.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeListScreenState();
  }
}

class RecipeListScreenState extends State<RecipeListScreen> {
  final List<Recipe> recipes = [
    Recipe(
      title: 'Pizza facile',
      user: 'Par Sammy Merazga',
      description: 'Pizza description',
      imageUrl:
          'https://www.mangezplus.com/wp-content/uploads/2018/11/pizza-recette-facile.jpg',
      isFavorite: false,
      favoriteCount: 0,
    ),
    Recipe(
      title: 'Burger Maison',
      user: 'Par Sammy Merazga',
      description: 'Burger description',
      imageUrl:
          'https://www.adeline-cuisine.fr/wp-content/uploads/2016/11/burger-savoyard-raclette-jambon-fume-maison-recette.jpg',
      isFavorite: false,
      favoriteCount: 0,
    ),
    Recipe(
      title: 'Tartes aux pommes',
      user: 'Par Sammy Merazga',
      description: 'Tartes aux pommes description',
      imageUrl:
          'https://static.750g.com/images/600-600/9823eb627203c878f3e36d72f8ce6d1c/tarte-aux-pommes.jpg',
      isFavorite: false,
      favoriteCount: 0,
    ),
    Recipe(
      title: 'Tiramisu au spéculoos',
      user: 'Par Sammy Merazga',
      description: 'Tiramisu description',
      imageUrl:
          'https://cooking-chef.sa.metacdn.com/sites/default/files/recettes/tiramisu_1.jpg',
      isFavorite: false,
      favoriteCount: 0,
    ),
    Recipe(
      title: 'Taasbant',
      user: 'Par Neness',
      description: 'Taasbant description',
      imageUrl:
          'http://www.lesfoodies.com/_recipeimage/149319/lasbanne-tikourbabine-boulettes-semoule.jpg',
      isFavorite: false,
      favoriteCount: 0,
    ),
    Recipe(
      title: 'Bavarois Fraise',
      user: 'Par Sammy Merazga',
      description: 'Bavarois description',
      imageUrl:
          'http://www.lesfoodies.com/_recipeimage/252368/bavarois-a-la-fraise-6.jpg',
      isFavorite: false,
      favoriteCount: 0,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes recettes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Dismissible(
              key: Key(recipe.title),
              onDismissed: (direction) {
                setState(() {
                  recipes.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${recipe.title} supprimé')));
              },
              background: Container(color: Colors.red),
              child: RecipeItemWidget(recipe: recipe));
        },
      ),
    );
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/recipe', arguments: recipe);
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Hero(
              tag: "imageRecipe" + recipe.title,
              child: CachedNetworkImage(
                imageUrl: recipe.imageUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(recipe.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Text(recipe.user,
                      style: TextStyle(color: Colors.grey[500], fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
