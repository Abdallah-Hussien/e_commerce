import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

final listOfCategories = [
  {
    "id": 1,
    "slug": "clothes",
    "name": "Clothes",
    "image": "https://i.imgur.com/QkIa5tT.jpeg"
  },
  {
    "id": 2,
    "slug": "electronics",
    "name": "Electronics",
    "image": "https://i.imgur.com/ZANVnHE.jpeg"
  },
  {
    "id": 3,
    "slug": "furniture",
    "name": "Furniture",
    "image": "https://i.imgur.com/Qphac99.jpeg"
  },
  {
    "id": 4,
    "slug": "shoes",
    "name": "Shoes",
    "image": "https://i.imgur.com/qNOjJje.jpeg"
  },
  {
    "id": 5,
    "slug": "miscellaneous",
    "name": "Miscellaneous",
    "image": "https://i.imgur.com/BG8J0Fj.jpg"
  }
].map((json) => CategoryModel.fromJson(json)).toList();
