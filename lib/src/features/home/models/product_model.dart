import 'package:equatable/equatable.dart';

class ProductModel extends Equatable{
  final int id;
  final String image;
  final String title;
  final int price;
  final int unit;

  const ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.unit,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'price': price,
      'unit': unit,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      price: json['price'],
      unit: json['unit'],
    );
  }

   @override
  List<Object?> get props => [id, image, title, price, unit];
}
