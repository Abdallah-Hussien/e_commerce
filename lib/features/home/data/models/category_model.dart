import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final String? id;
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
