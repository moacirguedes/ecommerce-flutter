import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/order_model.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';

import 'cart_provider.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel> orders = [];
  UserModel user;

  OrderProvider() {
    loadOrders();
  }

  void updateUser(UserProvider userProvider) async {
    user = await userProvider.user;
    orders.clear();
    if (user != null) {
      loadOrders();
    }
  }

  Future<void> loadOrders() async {
    try {
      final QuerySnapshot orderSnap = await user.orderReference.get();
      orders =
          orderSnap.docs.map((doc) => OrderModel.fromDocument(doc)).toList();
    } catch (e) {}
  }

  Future<void> completeOrder(CartProvider cartProvider) async {
    if (cartProvider.user != null && cartProvider.totalPrice > 0.0) {
      try {
        final newOrder = OrderModel.fromOrder(
            cartProvider.user,
            cartProvider.addressModel,
            cartProvider.totalPrice,
            cartProvider.items.length);

        cartProvider.user.orderReference
            .add(newOrder.toOrderMap())
            .then((doc) => doc.id);
      } catch (e) {}
    }
  }
}
