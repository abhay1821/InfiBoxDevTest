enum ViewState {
  idle,
  busy,
}

enum CategoryFilter {
  jewelery("Jewelery"),
  electronics("Electronics"),
  womenclothing("Women's Clothing"),
  menclothing("Men's Clothing");

  const CategoryFilter(this.value);
  final String value;
}
