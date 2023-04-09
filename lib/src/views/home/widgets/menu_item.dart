import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/string_constants.dart';
import '../../../models/restaurant_model.dart';
import '../menu_details.dart';

class MenuItemWidget extends StatelessWidget {
  final String name;
  final List<Product> products;
  final String sliderImage;
  final String isActive;

  const MenuItemWidget({
    super.key,
    required this.size,
    required this.name,
    required this.products,
    required this.sliderImage,
    required this.isActive,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(MenuDetails(
          title: name,
          products: products,
        ));
      },
      child: SizedBox(
        height: 200,
        width: size.width,
        child: Card(
          child: Stack(alignment: Alignment.center, children: [
            SizedBox(
              width: size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  sliderImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isActive == "1" ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isActive == "1"
                        ? StringConstants.inStock
                        : StringConstants.outOfStock,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                )),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}
