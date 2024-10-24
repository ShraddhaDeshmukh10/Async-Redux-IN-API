class AppState {
  final List<Product> fetchProducts;
  final String url;

  AppState({required this.url, required this.fetchProducts});

  AppState copy({List<Product>? fetchProducts, String? url}) {
    return AppState(
        url: url ?? this.url,
        fetchProducts: fetchProducts ?? this.fetchProducts);
  }

  static AppState initialState() =>
      AppState(url: "https://fakestoreapi.com/products", fetchProducts: []);
}

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}
