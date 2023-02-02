import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:infi_devtest/buisness_logic/models/products.dart';

class RatingsWidget extends StatelessWidget {
  const RatingsWidget({
    Key? key,
    required this.prodData,
  }) : super(key: key);

  final Products prodData;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: prodData.rating?.rate ?? 2,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      itemBuilder: (context, _) => const Icon(
        size: 2,
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        // print(rating);
      },
    );
  }
}
