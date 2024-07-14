import 'package:dfa_media_example/dfa_media.dart';
import 'package:dfa_media_example/src/features/home/repository/request_repository.dart';
import 'package:flutter/material.dart';

void main() {
  final RequestRepository historyRepository = RequestRepository();
  runApp(DfaMediaApp(historyRepository: historyRepository));
}
