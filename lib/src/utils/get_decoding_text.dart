import 'dart:convert';

class GetDecodingText {
  String decodeText(String text) {
    String result = utf8.decode(latin1.encode(text));
    return result;                  
  }
}