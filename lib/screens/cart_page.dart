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
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.addToCartPlant.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NewPlantWidget(
                          plantList: widget.addToCartPlant,
                          index: index,
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                child: Image.asset(
                                    'assets/images/PriceUnit-green.png'),
                              ),
                              const SizedBox(width: 5),
                                const Text(
                                 '22',
                                style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  color: Constants.primaryColor,
                                  fontSize: 20,
                                ),
                              ),

                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'جمع کل',
                                style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
