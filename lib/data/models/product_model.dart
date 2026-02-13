class Product {
  final int? id;
  final String title;
  final double price;
  final String thumbnail;
  final double? rating;

  Product({
    this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    this.rating,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail'],
      rating: (json['rating'] as num?)?.toDouble(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "thumbnail": thumbnail,
      "rating": rating,
    };
  }
}


