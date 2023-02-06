import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:firebaseapp/wallss/servies/models.dart';
import 'package:get/get.dart';

class SimpleUIController extends GetxController {
  RxList<PhotosModels> photos = RxList();
  RxBool isLoading = true.obs;
  RxString orderBy = "popular".obs;
  RxString apikey = "MyAIUi_YHaMNWw_9NR77rXrjKsHJ4Y2Ah9xX54hDoJw".obs;
  var selectedIndex = 0.obs;
  List<String> orders = [
    "latest",
    "popular",
    "oldest",
    "views",
  ];

  /// Get Picture
  getPictureData() async {
    isLoading.value = true;
    var j;
    //https://api.unsplash.com/photos/?per_page=80&order_by=${orderBy.value}&client_id=$apikey
    var lo = 'https://api.unsplash.com/search/photos?page=1&query=office';
    var response = await DioService().getMethod(j);
    photos = RxList();
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        photos.add(PhotosModels.fromJson(element));
      });
      isLoading.value = false;
    }

    log(response.statusCode);
  }

  /// changing order value
  ordersFunc(String newVal) {
    orderBy.value = newVal;
    getPictureData();
  }

  @override
  void onInit() {
    getPictureData();
    super.onInit();
  }
}

class DioService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      log(response.toString());
      return response;
    });
  }
}
