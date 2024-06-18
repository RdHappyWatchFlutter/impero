import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impero/controller/dashboard_controller.dart';
import 'package:impero/view/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
final DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Impero',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DashBoard(),
    );
  }
}

