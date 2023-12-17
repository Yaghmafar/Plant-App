import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/new_plant_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritePlant;

  const FavoritePage({super.key, required this.favoritePlant});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritePlant.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    child: Image.asset('assets/images/favorited.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'ظاهرا به هیچی علاقه نداشتی :(',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Vazir',
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              child: ListView.builder(
                itemCount: widget.favoritePlant.length,
                itemBuilder: (context, index) {
                  return NewPlantWidget(
                      plantList: widget.favoritePlant, index: index);
                },
              ),
            ),
    );
  }
}
