import 'package:ecommerce/providers/order_provider.dart';
import 'package:ecommerce/widgets/user/user_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrderProvider _orderProvider = Provider.of<OrderProvider>(context);

    return Expanded(
        child: ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _orderProvider.orders.length,
      itemBuilder: (_, index) {
        return OrderItem(_orderProvider.orders[index]);
      },
    ));
  }
}
