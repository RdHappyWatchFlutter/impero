// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int status;
  String message;
  Result result;

  Product({
    required this.status,
    required this.message,
    required this.result,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    status: json["Status"],
    message: json["Message"],
    result: Result.fromJson(json["Result"]),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "Result": result.toJson(),
  };
}

class Result {
  List<Category> category;

  Result({
    required this.category,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: List<Category>.from(json["Category"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String name;
  int? isAuthorize;
  int update080819;
  int update130919;
  List<SubCategory>? subCategories;

  Category({
    required this.id,
    required this.name,
    this.isAuthorize,
    required this.update080819,
    required this.update130919,
    this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["Id"],
    name: json["Name"],
    isAuthorize: json["IsAuthorize"],
    update080819: json["Update080819"],
    update130919: json["Update130919"],
    subCategories: json["SubCategories"] == null ? [] : List<SubCategory>.from(json["SubCategories"]!.map((x) => SubCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "IsAuthorize": isAuthorize,
    "Update080819": update080819,
    "Update130919": update130919,
    "SubCategories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
  };
}

class SubCategory {
  int id;
  String name;
  List<ProductElement> product;

  SubCategory({
    required this.id,
    required this.name,
    required this.product,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["Id"],
    name: json["Name"],
    product: List<ProductElement>.from(json["Product"].map((x) => ProductElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Product": List<dynamic>.from(product.map((x) => x.toJson())),
  };
}

class ProductElement {
  String name;
  String priceCode;
  String imageName;
  int id;

  ProductElement({
    required this.name,
    required this.priceCode,
    required this.imageName,
    required this.id,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
    name: json["Name"],
    priceCode: json["PriceCode"],
    imageName: json["ImageName"],
    id: json["Id"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "PriceCode": priceCode,
    "ImageName": imageName,
    "Id": id,
  };
}
