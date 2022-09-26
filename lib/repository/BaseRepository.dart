// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../app_configurations/app_config.dart';

class BaseRepository {
  final String controller;

  BaseRepository({
    required this.controller,
  });

  var headers = {
    "content-type": "multipart/form-data",
    "Authorization": "Bearer: ${AppConfiguration.token}",
  };

  header() => {
        "content-type": "application/json",
      };

  // mah.4dev

  Future<List<dynamic>> getData() async {
    var response = await http.get(
        Uri.parse("${AppConfiguration.baseUrl}/$controller"),
        headers: header());
    var result = [];
    try {
      result = json.decode(response.body);
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<bool> storeData(dynamic data) async {
    var res = await http.post(
        Uri.parse("${AppConfiguration.baseUrl}/$controller/store"),
        body: json.encode(data),
        headers: header());
    return res.statusCode == 201;
  }
  //
  // storeDataWithImage(dynamic data, XFile file) async {
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse("${AppConfiguration.baseUrl}/$controller/store_with_image"));
  //   request = jsonToFormData(request, data);
  //   request.files
  //       .add(await http.MultipartFile.fromPath('imageFile', file.path));
  //   request.headers.addAll(headers);
  //   try {
  //     var response = await request.send();
  //     print(response.statusCode);
  //     var x = await response.stream.bytesToString();
  //     print(x);
  //     if (response.statusCode == 200) {
  //       final responseString = await response.stream.bytesToString();
  //       print(responseString);
  //       print("Uploaded!");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  storeDataWithImages(Map<String, dynamic> data, List<XFile> files) async {
    print(files.length);
    var request = http.MultipartRequest(
        'POST', Uri.parse("${AppConfiguration.baseUrl}/$controller/Create"));
    request = jsonToFormData(request, data);
    print(request.url);
    for (int i = 0; i < files.length; i++) {
      request.files
          .add(await http.MultipartFile.fromPath('PostImages', files[i].path));
    }
    request.headers.addAll(headers);
    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      print(responseString);
      print("Uploaded!");
    }
  }
  //
  // addData(dynamic data) async {
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse("${AppConfiguration.baseUrl}/$controller/Create"));
  //   request = jsonToFormData(request, data);
  //
  //   request.headers.addAll(headers);
  //   try {
  //     var response = await request.send();
  //     print(response.statusCode);
  //     var x = await response.stream.bytesToString();
  //     print(x);
  //     if (response.statusCode == 200) {
  //       final responseString = await response.stream.bytesToString();
  //       print(responseString);
  //       print("Uploaded!");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  updateData(int id, dynamic data) async {
    var response = await http.put(
        Uri.parse("${AppConfiguration.baseUrl}/$controller/$id"),
        headers: headers,
        body: jsonEncode(data));
    print(response.statusCode);
    print(jsonDecode(response.body));
  }

  deleteData(int id) async {
    var response = await http.delete(
        Uri.parse("${AppConfiguration.baseUrl}/$controller/$id"),
        headers: headers);
    print(response.statusCode);
  }

  jsonToFormData(http.MultipartRequest request, Map<String, dynamic> data) {
    for (var key in data.keys) {
      if (data[key] != null) request.fields[key] = data[key].toString();
    }
    return request;
  }
}
