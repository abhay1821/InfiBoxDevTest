import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:infi_devtest/buisness_logic/models/products.dart';
import 'package:infi_devtest/buisness_logic/utils/enums.dart';
import 'package:infi_devtest/buisness_logic/utils/input_decoration.dart';
import 'package:infi_devtest/buisness_logic/utils/routes.dart';
import 'package:infi_devtest/buisness_logic/view_models/cart_view_model.dart';
import 'package:infi_devtest/buisness_logic/view_models/home_screen_view_model.dart';
import 'package:infi_devtest/services/service_locator.dart';
import 'package:infi_devtest/ui/views/base_view.dart';
import 'package:infi_devtest/ui/views/product_detail_view.dart';
import 'package:infi_devtest/ui/widgets/background_grad.dart';
import 'package:infi_devtest/ui/widgets/badge.dart';
import 'package:infi_devtest/ui/widgets/product_grid.dart';
import 'package:infi_devtest/ui/widgets/shimmer_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool favorite = false;
  final List<String> _filters = <String>[];
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenViewModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                const BackgroundGradient(),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            color: const Color.fromARGB(255, 245, 245, 247).withOpacity(0.56),
                            blurRadius: 45.0,
                          ),
                        ],
                        color: const Color.fromARGB(255, 226, 229, 223),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: model.isBusy
                                ? const ShimmerCard(
                                    borderRadius: 30,
                                    size: Size(double.infinity, 50.0),
                                  )
                                : SizedBox(
                                    width: double.infinity,
                                    height: sizeConfig.getPropHeight(50),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: sizeConfig.getPropWidth(300),
                                          child: TextField(
                                            onChanged: (value) {
                                              Provider.of<HomeScreenViewModel>(context, listen: false)
                                                  .changeProdList(value);
                                            },
                                            decoration: TextInputDecoration.inputDecoration(context),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sizeConfig.getPropWidth(50),
                                          child: Consumer<CartViewModel>(
                                            builder: (_, cart, ch) => Badge(
                                              value: cart.items.length,
                                              child: ch ?? Container(),
                                            ),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.shopping_cart,
                                                size: 35,
                                              ),
                                              onPressed: () {
                                                navigationService.pushScreen(Routes.cartScreen);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              left: 7,
                            ),
                            child: model.isBusy
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: List.generate(
                                      4,
                                      (index) => const ShimmerCard(
                                        borderRadius: 30,
                                        size: Size(50.0, 30.0),
                                      ),
                                    ),
                                  )
                                : Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    spacing: 5.0,
                                    children: CategoryFilter.values.map(
                                      (CategoryFilter exercise) {
                                        return FilterChip(
                                          label: Text(
                                            exercise.value,
                                            style: Theme.of(context).textTheme.headline2,
                                          ),
                                          selectedColor: const Color(0xff11D0A2),
                                          shape: const StadiumBorder(side: BorderSide()),
                                          selected: _filters.contains(exercise.name),
                                          onSelected: (bool value) {
                                            setState(
                                              () {
                                                if (value) {
                                                  if (!_filters.contains(exercise.name)) {
                                                    _filters.add(exercise.name);
                                                    Provider.of<HomeScreenViewModel>(context, listen: false)
                                                        .filterprodList(exercise.value.toLowerCase(), _filters.length);
                                                  }
                                                } else {
                                                  _filters.removeWhere((String name) {
                                                    return name == exercise.name;
                                                  });
                                                  Provider.of<HomeScreenViewModel>(context, listen: false)
                                                      .removeProdList(exercise.value.toLowerCase(), _filters.length);
                                                }
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ).toList(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: sizeConfig.getPropHeight(260),
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: model.isBusy ? 6 : model.filterList.length,
                        itemBuilder: (ctx, index) {
                          if (model.isBusy) {
                            return const ShimmerCard(
                              borderRadius: 30,
                              size: Size(180.0, 230.0),
                            );
                          }
                          return _prodContainer(model.filterList[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _prodContainer(Products model) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      middleColor: Colors.transparent,
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedElevation: 12,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      closedBuilder: (BuildContext c, VoidCallback action) {
        return ProdView(
          prodData: model,
        );
      },
      openBuilder: (
        BuildContext context,
        void Function({Object? returnValue}) action,
      ) {
        return ProductDetailView(prodData: model);
      },
      tappable: true,
    );
  }
}
