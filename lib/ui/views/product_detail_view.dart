import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infi_devtest/buisness_logic/models/cart_model.dart';
import 'package:infi_devtest/buisness_logic/models/products.dart';
import 'package:infi_devtest/buisness_logic/utils/routes.dart';
import 'package:infi_devtest/buisness_logic/view_models/cart_view_model.dart';
import 'package:infi_devtest/services/service_locator.dart';
import 'package:infi_devtest/ui/widgets/rating_widget.dart';
import 'package:infi_devtest/ui/widgets/rounded_edge_button.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatelessWidget {
  final Products prodData;
  const ProductDetailView({
    Key? key,
    required this.prodData,
  }) : super(key: key);
  static const String route = '/detailPage';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: ThemeData.estimateBrightnessForColor(Colors.white) == Brightness.dark
          ? SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white)
          : SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        // appBar: ,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  snap: false,
                  pinned: true,
                  floating: false,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    // centerTitle: true,
                    // titlePadding: EdgeInsets.only(
                    //     left: sizeConfig.getPropWidth(20),
                    //     bottom: sizeConfig.getPropHeight(20),
                    //     right: sizeConfig.getPropWidth(6)),
                    // title: Hero(
                    //   tag: prodData.title!,
                    //   child: Material(
                    //     color: Colors.transparent,
                    //     child: Text(
                    //       prodData.title!,
                    //       style: const TextStyle(color: Color(0xff11D0A2)),
                    //     ),
                    //   ),
                    // ),
                    background: Padding(
                      padding: const EdgeInsets.only(top: kToolbarHeight),
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
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: IconButton(
                        color: Colors.black,
                        icon: const Icon(
                          Icons.shopping_cart,
                          size: 35,
                        ),
                        onPressed: () {
                          navigationService.pushScreen(Routes.cartScreen);
                        },
                      ),
                    ),
                  ],
                  expandedHeight: sizeConfig.getPropHeight(380),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    tooltip: 'Menu',
                    onPressed: () => navigationService.pop(),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: EdgeInsets.only(
                          top: sizeConfig.getPropHeight(30),
                          right: sizeConfig.getPropWidth(20),
                          left: sizeConfig.getPropWidth(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            SizedBox(
                              height: sizeConfig.getPropHeight(10),
                            ),
                            Text(
                              prodData.title!,
                              style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: sizeConfig.getPropHeight(18),
                          right: sizeConfig.getPropWidth(20),
                          left: sizeConfig.getPropWidth(20),
                        ),
                        child: Row(
                          children: [
                            _headingDescription(context, 'MRP :', " ₹${prodData.price}"),
                            const Spacer(),
                            RatingsWidget(prodData: prodData),
                            Text(
                              '(${prodData.rating?.count})',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: sizeConfig.getPropHeight(18),
                          right: sizeConfig.getPropWidth(20),
                          left: sizeConfig.getPropWidth(20),
                        ),
                        child: _headingDescription(context, 'Category : ', prodData.category!),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: sizeConfig.getPropHeight(30),
                          right: sizeConfig.getPropWidth(20),
                          left: sizeConfig.getPropWidth(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            SizedBox(
                              height: sizeConfig.getPropHeight(20),
                            ),
                            Text(
                              prodData.description!,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(
                              height: sizeConfig.getPropHeight(80),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: sizeConfig.getPropHeight(80),
                color: Colors.white,
                alignment: Alignment.center,
                child: RoundedButton(
                  onTap: () {
                    final item = CartItem(
                      id: prodData.id!,
                      title: prodData.title!,
                      quantity: 1,
                      price: prodData.price!,
                      imageUrl: prodData.image!,
                    );
                    Provider.of<CartViewModel>(context, listen: false).additem(item);
                  },
                  label: "Add to Cart",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _headingDescription(BuildContext context, String head, String des) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Color(0xff475464),
            fontSize: 13,
          ),
          children: <TextSpan>[
            TextSpan(
              text: head,
              style: Theme.of(context).textTheme.headline3,
            ),
            TextSpan(
              text: des,
              style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
