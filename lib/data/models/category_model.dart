import 'package:equatable/equatable.dart';
import 'package:my_store_hub/domain/entity/category.dart';

class CategoryModel extends Equatable {
  final int? id;
  final String name;

  const CategoryModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  factory CategoryModel.fromMap(Map<String, dynamic> map) => CategoryModel(
        id: map['id'],
        name: map['name'],
      );

  factory CategoryModel.fromEntity(Category category) => CategoryModel(
        id: category.id,
        name: category.name,
      );

  Category toEntity() => Category(
        id: id,
        name: name,
      );

  @override
  List<Object?> get props => [id, name];
}
