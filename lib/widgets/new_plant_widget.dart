import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/DetailPage.dart';
import 'package:plant_app/widgets/extensions.dart';

class NewPlantWidget extends StatelessWidget {
  final List<Plant> _plantList;
  final int index;
  const NewPlantWidget({
    super.key,
    required List<Plant> plantList, required this.index,
  }) : _plantList = plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: DetailPage(
              plantId: _plantList[index].plantId,
            ),
            type: PageTransitionType.fade,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80,
        width: size.width,
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                    height: 20,
                    child: Image.asset('assets/images/PriceUnit-green.png')),
                const SizedBox(width: 5),
                Text(
                  _plantList[index].price.toString().farsiNumber,
                  style: const TextStyle(
                    fontFamily: 'Lalezar',
                    color: Constants.primaryColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 0,
                  left: 0,
                  child: SizedBox(
                    height: 80,
                    child: Image.asset(_plantList[index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _plantList[index].category,
                        style: const TextStyle(
                          fontSize: 13,
                          fontFamily: 'Vazir',
                          color: Constants.blackColor,
                        ),
                      ),
                      Text(
                        _plantList[index].plantName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Vazir',
                          color: Constants.blackColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
