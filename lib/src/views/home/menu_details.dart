import 'package:flutter/material.dart';
import 'package:gis_axiom_test/src/constants/string_constants.dart';

import '../../models/restaurant_model.dart';

class MenuDetails extends StatelessWidget {
  final List<Product> products;
  const MenuDetails({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: products.isEmpty
            ? Center(
                child: Text(StringConstants.productNotFound),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: products.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(products[index].name),
                  );
                }),
      ),
    );
  }
}
