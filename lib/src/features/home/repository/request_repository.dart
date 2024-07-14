import 'dart:convert';

import 'package:dfa_media_example/src/features/home/models/banner_model.dart';
import 'package:dfa_media_example/src/features/home/models/product_model.dart';
import 'package:dfa_media_example/src/features/home/models/story_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestRepository {
  Future<List<dynamic>> fetchData(String params) async {
  var url = Uri.parse('https://bxtest.dfa-media.ru/udachny/$params.json');
  
  var response = await http.get(url);
  
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    var data = jsonResponse[params] as List<dynamic>;

    List<dynamic> items = [];
    
    for (var jsonData in data) {
      if (params == 'products') {
        int id = jsonData['id'];
        String image = jsonData['image'];
        String title = jsonData['title'];
        int price = jsonData['price'];
        int unit = jsonData['unit'];
        ProductModel product = ProductModel(
            id: id, image: image, title: title, price: price, unit: unit);
        items.add(product);
      } else if (params == 'story') {
        int id = jsonData['id'];
        String image = jsonData['preview_image'];
        String title = jsonData['title'];
        StoryModel story = StoryModel(
            id: id, image: image, title: title);
        items.add(story);
      } else if (params == 'banners') {
        int id = jsonData['id'];
        String image = jsonData['image'];
        BannerModel banner = BannerModel(
            id: id, image: image);
        items.add(banner);
      }
    }
    
    debugPrint('Data for $params: $items.');
    
    return items;
  } else {
    throw ('Request failed with status: ${response.statusCode}.');
  }
}
}