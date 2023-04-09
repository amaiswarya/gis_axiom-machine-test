import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gis_axiom_test/src/constants/string_constants.dart';
import '../../models/restaurant_model.dart';

class MenuDetails extends StatelessWidget {
  final List<Product> products;
  final String title;
  const MenuDetails({super.key, required this.products, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.green[100],
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: products.isEmpty
            ? Center(
                child: Text(StringConstants.productNotFound),
              )
            : GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.55,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemCount: products.length,
                itemBuilder: (BuildContext ctx, index) {
                  return productItem(index);
                }),
      ),
    );
  }

  Card productItem(int index) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    products[index].image,
                    height: 180,
                  ),
                ),
              ),
              Text(
                products[index].name.capitalizeFirst!,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Text(
                products[index].desc.capitalizeFirst!,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    products[index].isActive == "1"
                        ? StringConstants.inStock
                        : StringConstants.outOfStock,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: products[index].isActive == "1"
                            ? Colors.green
                            : Colors.red),
                  ),
                  Text(
                    '${products[index].amount} ${products[index].currency}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
