// @dart=2.9
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation/recipe.dart';
import 'package:formation/recipeBox.dart';

class RecipeFormScreen extends StatefulWidget {
  const RecipeFormScreen({Key key}) : super(key: key);

  @override
  State<RecipeFormScreen> createState() => _RecipeFormScreenState();
}

class _RecipeFormScreenState extends State<RecipeFormScreen> {
  static const String IMAGE_URL =
      "https://www.mon-panier-repas.fr/wp-content/uploads/2020/08/logo_mon_panier.jpg";

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final userController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouvelle recette'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    labelText: 'Titre',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez entrer un titre';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 5,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez entrer une description';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: TextFormField(
                controller: userController,
                decoration: InputDecoration(
                    labelText: 'Auteur',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez entrer l\'auteur de la recette';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    Recipe recipe = Recipe(
                        titleController.value.text,
                        userController.value.text,
                        IMAGE_URL,
                        descriptionController.value.text,
                        false,
                        new Random().nextInt(100));

                    RecipeBox.box.put(recipe.key(), recipe);
                    Navigator.pop(context);
                  }
                },
                child: Text('Enregistrer la recette'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
