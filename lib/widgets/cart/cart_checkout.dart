import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/order_provider.dart';
import 'package:ecommerce/providers/user_provider.dart';
import 'package:ecommerce/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_content.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider _userProvider = Provider.of<UserProvider>(context);
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);
    final OrderProvider _orderProvider = Provider.of<OrderProvider>(context);

    if (_userProvider.isLogado) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${_userProvider.user.firstName} ${_userProvider.user.lastName}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        "${_cartProvider.addressModel.street}, ${_cartProvider.addressModel.number} - ${_cartProvider.addressModel.zipCode}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CartContent(),
              const SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () async {
                  await _orderProvider.completeOrder(_cartProvider);
                  Navigator.of(context).pushNamed(Routes.HOME);
                },
                elevation: 0,
                textColor: Colors.white,
                color: Colors.lightBlueAccent,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Text(
                    "FINALIZAR PEDIDO",
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.LOGIN);
        },
        child: Text("LOGIN"),
      ),
    );
  }
}
