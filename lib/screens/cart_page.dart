import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/new_plant_widget.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addToCartPlant;

  const CartPage({super.key, required this.addToCartPlant});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addToCartPlant.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    child: Image.asset('assets/images/add-cart.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'سبد خرید خالی است',
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
                itemCount: widget.addToCartPlant.length,
                itemBuilder: (context, index) {
                  return NewPlantWidget(
                    plantList: widget.addToCartPlant,
                    index: index,
                  );
                },
              ),
            ),
    );
  }
}
