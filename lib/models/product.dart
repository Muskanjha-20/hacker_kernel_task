class ProductModel {
  final String name;
  final double price;

  ProductModel(this.name, this.price);

  // Convert a Product to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }

  // Convert a Map to a Product
  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      map['name'],
      map['price'],
    );
  }
}
