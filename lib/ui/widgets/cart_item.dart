import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infi_devtest/buisness_logic/view_models/cart_view_model.dart';
import 'package:infi_devtest/services/service_locator.dart';
import 'package:infi_devtest/ui/widgets/rounded_edge_button.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  // final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String imageUrl;

  const CartItemWidget({
    super.key,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(productId),
        background: Container(
          color: Theme.of(context).errorColor,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Are you Sure ?'),
              content: const Text(
                'Do you want to remove the Item from the Cart? ',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          );
        },
        onDismissed: (direction) {
          Provider.of<CartViewModel>(context, listen: false).removeitem(productId);
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: sizeConfig.getPropHeight(170),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 249, 249),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffB6B4B4),
                  offset: Offset(0, 6),
                  blurRadius: 15,
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 44,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70.0),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: sizeConfig.getPropWidth(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: sizeConfig.getPropHeight(55),
                          width: sizeConfig.getPropHeight(240),
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 16),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            "Quantity : $quantity X 1 ",
                            style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 16),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: sizeConfig.getPropHeight(70),
                      width: sizeConfig.getPropWidth(160),
                      alignment: Alignment.center,
                      child: RoundedButton(
                        onTap: () {},
                        label: 'Price: ₹ $price',
                      ),
                    ),
                    Container(
                      height: sizeConfig.getPropHeight(70),
                      width: sizeConfig.getPropWidth(150),
                      alignment: Alignment.center,
                      child: RoundedButton(
                        onTap: () {
                          Provider.of<CartViewModel>(context, listen: false).removeitem(productId);
                          navigationService.showSnackBar('Item Removed');
                        },
                        label: 'Remove',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
