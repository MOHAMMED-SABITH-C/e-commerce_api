// import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
// class Welcome {
//     List<Product> products;

//     Welcome({
//         required this.products,
//     });
//     factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
//     );

// }

// class Product {
//     int id;
//     String title;
//     String description;
//     String category;
//     double price;
//     double discountPercentage;
//     double rating;
//     int stock;
//     List<String> tags;
//     String brand;
//     String sku;
//     int weight;
//     Dimensions dimensions;
//     String warrantyInformation;
//     String shippingInformation;
//     String availabilityStatus;
//     List<Review> reviews;
//     String returnPolicy;
//     int minimumOrderQuantity;
//     // Meta meta;
//     List<String> images;
//     String thumbnail;

//     Product({
//         required this.id,
//         required this.title,
//         required this.description,
//         required this.category,
//         required this.price,
//         required this.discountPercentage,
//         required this.rating,
//         required this.stock,
//         required this.tags,
//         required this.brand,
//         required this.sku,
//         required this.weight,
//         required this.dimensions,
//         required this.warrantyInformation,
//         required this.shippingInformation,
//         required this.availabilityStatus,
//         required this.reviews,
//         required this.returnPolicy,
//         required this.minimumOrderQuantity,
//         // required this.meta,
//         required this.images,
//         required this.thumbnail,
//     });
//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         category: json["category"],
//         price: json["price"]?.toDouble(),
//         discountPercentage: json["discountPercentage"]?.toDouble(),
//         rating: json["rating"]?.toDouble(),
//         stock: json["stock"],
//         tags: List<String>.from(json["tags"].map((x) => x)),
//         brand: json["brand"],
//         sku: json["sku"],
//         weight: json["weight"],
//         dimensions: Dimensions.fromJson(json["dimensions"]),
//         warrantyInformation: json["warrantyInformation"],
//         shippingInformation: json["shippingInformation"],
//         availabilityStatus: json["availabilityStatus"],
//         reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
//         returnPolicy: json["returnPolicy"],
//         minimumOrderQuantity: json["minimumOrderQuantity"],
//         // meta: Meta.fromJson(json["meta"]),
//         images: List<String>.from(json["images"].map((x) => x)),
//         thumbnail: json["thumbnail"],
//     );

// }

// class Dimensions {
//     double width;
//     double height;
//     double depth;

//     Dimensions({
//         required this.width,
//         required this.height,
//         required this.depth,
//     });
//     factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
//         width: json["width"]?.toDouble(),
//         height: json["height"]?.toDouble(),
//         depth: json["depth"]?.toDouble(),
//     );

// }

// // class Meta {
// //     DateTime createdAt;
// //     DateTime updatedAt;
// //     String barcode;
// //     String qrCode;

// //     Meta({
// //         required this.createdAt,
// //         required this.updatedAt,
// //         required this.barcode,
// //         required this.qrCode,
// //     });
//       // factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//       //         createdAt: DateTime.parse(json["createdAt"]),
//       //         updatedAt: DateTime.parse(json["updatedAt"]),
//       //         barcode: json["barcode"],
//       //         qrCode: json["qrCode"],
//       //     );

// // }

// class Review {
//     int rating;
//     String comment;
//     DateTime date;
//     String reviewerName;
//     String reviewerEmail;

//     Review({
//         required this.rating,
//         required this.comment,
//         required this.date,
//         required this.reviewerName,
//         required this.reviewerEmail,
//     });
//     factory Review.fromJson(Map<String, dynamic> json) => Review(
//         rating: json["rating"],
//         comment: json["comment"],
//         date: DateTime.parse(json["date"]),
//         reviewerName: json["reviewerName"],
//         reviewerEmail: json["reviewerEmail"],
//     );


// }
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

class Welcome {
  List<Product> products;

  Welcome({
    required this.products,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) {
    // print("Parsing Welcome");
    return Welcome(
      products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );
  }
}

class Product {
  int id;
  String title;
  String? description;
  String? category;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  List<String>? tags;
  String? brand;
  String? sku;
  double weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Review>? reviews;
  String? returnPolicy;
  int minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    required this.id,
    required this.title,
    this.description,
    this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    this.tags,
    this.brand,
    this.sku,
    required this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    required this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // print("Parsing Product: ${json["title"]}");
    return Product(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      category: json["category"],
      price: json["price"]?.toDouble() ?? 0.0,
      discountPercentage: json["discountPercentage"]?.toDouble() ?? 0.0,
      rating: json["rating"]?.toDouble() ?? 0.0,
      stock: json["stock"] ?? 0,
      tags: json["tags"] == null ? null : List<String>.from(json["tags"].map((x) => x)),
      brand: json["brand"],
      sku: json["sku"],
      weight: json["weight"]?.toDouble() ?? 0.0,
      dimensions: json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]),
      warrantyInformation: json["warrantyInformation"],
      shippingInformation: json["shippingInformation"],
      availabilityStatus: json["availabilityStatus"],
      reviews: json["reviews"] == null ? null : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      returnPolicy: json["returnPolicy"],
      minimumOrderQuantity: json["minimumOrderQuantity"] ?? 0,
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      images: json["images"] == null ? null : List<String>.from(json["images"].map((x) => x)),
      thumbnail: json["thumbnail"],
    );
  }
}

class Dimensions {
  double width;
  double height;
  double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    // print("Parsing Dimensions");
    return Dimensions(
      width: json["width"]?.toDouble() ?? 0.0,
      height: json["height"]?.toDouble() ?? 0.0,
      depth: json["depth"]?.toDouble() ?? 0.0,
    );
  }
}

class Meta {
  String createdAt;
  String updatedAt;
  String barcode;
  String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    // print("Parsing Meta");
    return Meta(
      createdAt: json["createdAt"] ?? '',
      updatedAt: json["updatedAt"] ?? '',
      barcode: json["barcode"] ?? '',
      qrCode: json["qrCode"] ?? '',
    );
  }
}

class Review {
  int rating;
  String comment;
  String date;
  String reviewerName;
  String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    // print("Parsing Review by: ${json["reviewerName"]}");
    return Review(
      rating: json["rating"] ?? 0,
      comment: json["comment"] ?? '',
      date: json["date"] ?? '',
      reviewerName: json["reviewerName"] ?? '',
      reviewerEmail: json["reviewerEmail"] ?? '',
    );
  }
}
