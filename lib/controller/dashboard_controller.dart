import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:impero/model/product.dart';
import 'package:impero/network/api_functions.dart';

class DashboardController extends GetxController{

  @override
  void onInit() {
    super.onInit();
  }

  static final DashboardController instance = DashboardController.internal();
  List<Category> listCategory = [];
  List<String> categoryName = [];
  List<Tab> tabList = <Tab>[];

  factory DashboardController() {
    return instance;
  }

  DashboardController.internal();
  late TabController tabController;

  Future<List<Category>> getCategoryList()async{
    print('object');
    var response = await  http.post(
        Uri.parse(ApiFunctions.BaseUrl+ApiFunctions.Dashboard),
      body: {
        "CategoryId":'0',
        "DeviceManufacturer":"Google",
        "DeviceModel":"Android SDK built for x86",
        "DeviceToken":" ",
        "PageIndex":'1'
      }
    );
    print(response.body);
    if(response.statusCode == 200) {
      Product product = Product.fromJson(jsonDecode(response.body));

      List<Category>? categoryList = product.result.category;
      for(var name in categoryList){
        if(!categoryName.contains(name.name)) {
          categoryName.add(name.name);
        }
      }
      for(var e in categoryName){
        if(!tabList.contains(Tab(text: e.toString(),))){
          tabList.add(
              Tab(text: e.capitalizeFirst,)
          );
        }
      }
      print('tabList.length');
      print(tabList.length);
      print('categoryName.length');
      print(categoryName.length);
      update();
      return categoryList;
    }else{
      print(response.reasonPhrase.toString());
      return [];
    }
  }
  Future<List<SubCategory>> subCategoryList()async{
    List<Category> list = await getCategoryList();
    List<SubCategory>? subCategoryList = list[0].subCategories;
    return subCategoryList!;
  }

}