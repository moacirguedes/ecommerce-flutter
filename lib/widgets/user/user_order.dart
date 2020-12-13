import 'package:ecommerce/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final OrderModel orderModel;

  const OrderItem(this.orderModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Preço:",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${orderModel.totalPrice}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Itens:",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${orderModel.itemsCount}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
