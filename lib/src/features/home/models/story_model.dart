import 'package:equatable/equatable.dart';

class StoryModel extends Equatable {
  final int id;
  final String image;
  final String title;

  const StoryModel({
    required this.id,
    required this.image,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'preview_image': image,
      'title': title,
    };
  }

  factory StoryModel.fromMap(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      image: json['preview_image'],
      title: json['title'],
    );
  }
  
  @override
  List<Object?> get props => [id, image, title];
}
