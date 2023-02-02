import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infi_devtest/buisness_logic/models/cart_model.dart';
import 'package:infi_devtest/buisness_logic/models/products.dart';
import 'package:infi_devtest/buisness_logic/view_models/cart_view_model.dart';
import 'package:infi_devtest/services/service_locator.dart';
import 'package:infi_devtest/ui/widgets/rating_widget.dart';
import 'package:provider/provider.dart';

class ProdView extends StatelessWidget {
  final Products prodData;
  const ProdView({
    Key? key,
    required this.prodData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xffB6B4B4),
              offset: Offset(0, 6),
              blurRadius: 15,
            )
          ],
        ),
        height: sizeConfig.getPropHeight(230),
        width: sizeConfig.getPropWidth(180),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(
                '₹ ${prodData.price}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Colors.white,
                    ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  final item = CartItem(
                    id: prodData.id!,
                    title: prodData.title!,
                    quantity: 1,
                    price: prodData.price!,
                    imageUrl: prodData.image!,
                  );
                  Provider.of<CartViewModel>(context, listen: false).additem(item);
                  navigationService.showSnackBar('Item added to Cart');
                },
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: sizeConfig.getPropHeight(155),
                  width: double.infinity,
                  child: Hero(
                    tag: prodData.image!,
                    child: CachedNetworkImage(
                      imageUrl: prodData.image!,
                      fit: BoxFit.fill,
                      errorWidget: (context, string, data) {
                        return Container(
                          color: Colors.black,
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  height: sizeConfig.getPropHeight(15),
                  child: Hero(
                    tag: prodData.title!,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        prodData.title!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingsWidget(prodData: prodData),
                    Text(
                      '(${prodData.rating!.count})',
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
