class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;

  Product({
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    required this.title,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        description: json['description'],
        image: json['image'],
        price: json['price'],
        title: json['title'],
        category: json['category']);
  }
}
