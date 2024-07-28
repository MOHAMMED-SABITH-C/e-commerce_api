// // // product_list_page.dart (mocking the response for local testing)
// // import 'dart:convert';
// // import 'package:e_commerce_app/forgotPass.dart';
// // import 'package:e_commerce_app/json_model.dart';
// // import 'package:flutter/material.dart';
// // // import 'models.dart';
// // // import 'product_detail_page.dart';

// // class ProductListPage extends StatefulWidget {
// //   @override
// //   _ProductListPageState createState() => _ProductListPageState();
// // }

// // class _ProductListPageState extends State<ProductListPage> {
// //   Future<Welcome> fetchProducts() async {
// //     // Mocking JSON data as if fetched from an API
// //     final response = {
// //       "products": [
// //         {
// //           "id": 1,
// //           "title": "Essence Mascara Lash Princess",
// //           "description": "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
// //           "category": "beauty",
// //           "price": 9.99,
// //           "discountPercentage": 7.17,
// //           "rating": 4.94,
// //           "stock": 5,
// //           "tags": ["beauty", "mascara"],
// //           "brand": "Essence",
// //           "sku": "RCH45Q1A",
// //           "weight": 2,
// //           "dimensions": {"width": 23.17, "height": 14.43, "depth": 28.01},
// //           "warrantyInformation": "1 month warranty",
// //           "shippingInformation": "Ships in 1 month",
// //           "availabilityStatus": "Low Stock",
// //           "reviews": [
// //             {"rating": 2, "comment": "Very unhappy with my purchase!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "John Doe"},
// //             {"rating": 2, "comment": "Not as described!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "Nolan Gonzalez"},
// //             {"rating": 5, "comment": "Very satisfied!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "Scarlett Wright"}
// //           ],
// //           "returnPolicy": "30 days return policy",
// //           "minimumOrderQuantity": 24,
// //           "meta": {"createdAt": "2024-05-23T08:56:21.618Z", "updatedAt": "2024-05-23T08:56:21.618Z", "barcode": "9164035109868", "qrCode": "https://assets.dummyjson.com/public/qr-code.png"},
// //           "images": ["https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"],
// //           "thumbnail": "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
// //         },
// //         {
// //           "id": 2,
// //           "title": "Eyeshadow Palette with Mirror",
// //           "description": "The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it's convenient for on-the-go makeup application.",
// //           "category": "beauty",
// //           "price": 19.99,
// //           "discountPercentage": 5.5,
// //           "rating": 3.28,
// //           "stock": 44,
// //           "tags": ["beauty", "eyeshadow"],
// //           "brand": "Glamour Beauty",
// //           "sku": "MVCFH27F",
// //           "weight": 3,
// //           "dimensions": {"width": 12.42, "height": 8.63, "depth": 29.13},
// //           "warrantyInformation": "1 year warranty",
// //           "shippingInformation": "Ships in 2 weeks",
// //           "availabilityStatus": "In Stock",
// //           "reviews": [
// //             {"rating": 4, "comment": "Very satisfied!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "Liam Garcia"},
// //             {"rating": 1, "comment": "Very disappointed!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "Nora Russell"},
// //             {"rating": 5, "comment": "Highly impressed!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "Elena Baker"}
// //           ],
// //           "returnPolicy": "30 days return policy",
// //           "minimumOrderQuantity": 32,
// //           "meta": {"createdAt": "2024-05-23T08:56:21.618Z", "updatedAt": "2024-05-23T08:56:21.618Z", "barcode": "2817839095220", "qrCode": "https://assets.dummyjson.com/public/qr-code.png"},
// //           "images": ["https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/1.png"],
// //           "thumbnail": "https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png"
// //         }
// //       ]
// //     };

// //     await Future.delayed(Duration(seconds: 1)); // Simulate network delay
// //     return Welcome.fromJson(response);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Beauty Products'),
// //       ),
// //       body: FutureBuilder<Welcome>(
// //         future: fetchProducts(),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (!snapshot.hasData || snapshot.data!.products.isEmpty) {
// //             return Center(child: Text('No products found'));
// //           } else {
// //             final products = snapshot.data!.products;
// //             return ListView.builder(
// //               itemCount: products.length,
// //               itemBuilder: (context, index) {
// //                 final product = products[index];
// //                 return Card(
// //                   child: ListTile(
// //                     leading: Image.network(product.thumbnail?? 'https://via.placeholder.com/150'),
// //                     title: Text(product.title),
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => forgotPass(),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 );
// //               },
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
// // product_list_page.dart
// import 'dart:convert';
// import 'package:e_commerce_app/forgotPass.dart';
// import 'package:e_commerce_app/json_model.dart';
// import 'package:flutter/material.dart';
// // import 'models.dart';
// // import 'product_detail_page.dart';

// class ProductListPage extends StatefulWidget {
//   @override
//   _ProductListPageState createState() => _ProductListPageState();
// }

// class _ProductListPageState extends State<ProductListPage> {
//   Future<Welcome> fetchProducts() async {
//     // Mocking JSON data as if fetched from an API
//     final response = {
//       "products": [
//         {
//           "id": 1,
//           "title": "Essence Mascara Lash Princess",
//           "description": "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
//           "category": "beauty",
//           "price": 9.99,
//           "discountPercentage": 7.17,
//           "rating": 4.94,
//           "stock": 5,
//           "tags": ["beauty", "mascara"],
//           "brand": "Essence",
//           "sku": "RCH45Q1A",
//           "weight": 2,
//           "dimensions": {"width": 23.17, "height": 14.43, "depth": 28.01},
//           "warrantyInformation": "1 month warranty",
//           "shippingInformation": "Ships in 1 month",
//           "availabilityStatus": "Low Stock",
//           "reviews": [
//             {"rating": 2, "comment": "Very unhappy with my purchase!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "John Doe"},
//             {"rating": 2, "comment": "Not as described!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "Nolan Gonzalez"},
//             {"rating": 5, "comment": "Very satisfied!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "Scarlett Wright"}
//           ],
//           "returnPolicy": "30 days return policy",
//           "minimumOrderQuantity": 24,
//           "meta": {"createdAt": "2024-05-23T08:56:21.618Z", "updatedAt": "2024-05-23T08:56:21.618Z", "barcode": "9164035109868", "qrCode": "https://assets.dummyjson.com/public/qr-code.png"},
//           "images": ["https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"],
//           "thumbnail": "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
//         },
//         {
//           "id": 2,
//           "title": "Eyeshadow Palette with Mirror",
//           "description": "The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it's convenient for on-the-go makeup application.",
//           "category": "beauty",
//           "price": 19.99,
//           "discountPercentage": 5.5,
//           "rating": 3.28,
//           "stock": 44,
//           "tags": ["beauty", "eyeshadow"],
//           "brand": "Glamour Beauty",
//           "sku": "MVCFH27F",
//           "weight": 3,
//           "dimensions": {"width": 12.42, "height": 8.63, "depth": 29.13},
//           "warrantyInformation": "1 year warranty",
//           "shippingInformation": "Ships in 2 weeks",
//           "availabilityStatus": "In Stock",
//           "reviews": [
//             {"rating": 4, "comment": "Very satisfied!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "Liam Garcia"},
//             {"rating": 1, "comment": "Very disappointed!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "Nora Russell"},
//             {"rating": 5, "comment": "Highly impressed!", "date": "2024-05-23T08:56:21.618Z", "reviewerName": "Elena Baker"}
//           ],
//           "returnPolicy": "30 days return policy",
//           "minimumOrderQuantity": 32,
//           "meta": {"createdAt": "2024-05-23T08:56:21.618Z", "updatedAt": "2024-05-23T08:56:21.618Z", "barcode": "2817839095220", "qrCode": "https://assets.dummyjson.com/public/qr-code.png"},
//           "images": ["https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/1.png"],
//           "thumbnail": "https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png"
//         }
//       ]
//     };

//     await Future.delayed(Duration(seconds: 1)); // Simulate network delay
//     return Welcome.fromJson(response);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Beauty Products'),
//       ),
//       body: FutureBuilder<Welcome>(
//         future: fetchProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.products.isEmpty) {
//             return Center(child: Text('No products found'));
//           } else {
//             final products = snapshot.data!.products;
//             return ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return Card(
//                   child: ListTile(
//                     leading: Image.network(product.thumbnail ?? 'https://via.placeholder.com/150'),
//                     title: Text(product.title),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => forgotPass(),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
