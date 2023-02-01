class Products {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Products({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json['id'],
        title: json['title'],
        price: double.parse(json['price'].toString()),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
      );
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: double.parse(json['rate'].toString()),
      count: json['count'],
    );
  }
}
