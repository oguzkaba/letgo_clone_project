// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.productId,
    this.productCat,
    this.productLoc,
    this.productPic,
    this.productDate,
    this.productPrice,
    this.productState,
    this.productTitle,
    this.productDetails,
  });

  int? id;
  String? productId;
  String? productCat;
  String? productLoc;
  String? productPic;
  String? productDate;
  String? productPrice;
  String? productState;
  String? productTitle;
  String? productDetails;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productId: json["productId"],
        productCat: json["productCat"],
        productLoc: json["productLoc"],
        productPic: json["productPic"],
        productDate: json["productDate"],
        productPrice: json["productPrice"],
        productState: json["productState"],
        productTitle: json["productTitle"],
        productDetails: json["productDetails"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "productCat": productCat,
        "productLoc": productLoc,
        "productPic": productPic,
        "productDate": productDate,
        "productPrice": productPrice,
        "productState": productState,
        "productTitle": productTitle,
        "productDetails": productDetails,
      };
}
