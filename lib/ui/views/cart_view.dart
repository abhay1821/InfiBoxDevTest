import 'package:flutter/material.dart';
import 'package:infi_devtest/buisness_logic/view_models/cart_view_model.dart';
import 'package:infi_devtest/services/service_locator.dart';
import 'package:infi_devtest/ui/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final total = Provider.of<CartViewModel>(context).totalAmount;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff34AD64),
        title: Text(
          'Your Cart',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Expanded(
                child: Consumer<CartViewModel>(builder: (context, cartdetails, _) {
                  return ListView.builder(
                    itemCount: cartdetails.getitems.length,
                    itemBuilder: (ctx, i) => CartItemWidget(
                      productId: cartdetails.getitems[i].id.toString(),
                      price: cartdetails.getitems[i].price,
                      title: cartdetails.getitems[i].title,
                      quantity: cartdetails.getitems[i].quantity,
                      imageUrl: cartdetails.getitems[i].imageUrl,
                    ),
                  );
                }),
              ),
              SizedBox(
                height: sizeConfig.getPropHeight(70),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: sizeConfig.getPropHeight(80),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 87, 128, 99),
                ),
              ),
              child: Text(
                'Total Price : ₹ $total',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: const Color.fromARGB(255, 87, 128, 99),
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
