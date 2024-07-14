import 'package:equatable/equatable.dart';

class BannerModel extends Equatable{
  final int id;
  final String image;

  const BannerModel({
    required this.id,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [id, image];
}
