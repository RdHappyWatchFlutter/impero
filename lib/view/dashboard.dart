import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:impero/controller/dashboard_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:impero/model/product.dart';
import 'package:impero/view/product_detail.dart';
import 'package:page_transition/page_transition.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  @override
  void initState() {
    DashboardController.instance.getCategoryList();
    setState(() {

    });
    print(DashboardController.instance.categoryName.length);
    print(DashboardController.instance.categoryName.length);

    setState(() {

    });
    DashboardController.instance.tabController =
        TabController(length: DashboardController.instance.categoryName.length, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Impero',
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.filter_list_alt,color: Colors.white,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white,)),
          ],
        ),
        body: GetBuilder<DashboardController>(
          builder: (controller) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                      color: Colors.black,
                    height: 50.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: controller.categoryName.length,
                        itemBuilder: (context,index){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Center(child: Text(
                          controller.categoryName[index].toString(),
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      );
                    })
                  ),
                  Expanded(
                    child: FutureBuilder<List<SubCategory>>(
                        initialData: [],
                        future: controller.subCategoryList(),
                        builder: (context,AsyncSnapshot<List<SubCategory>> data){
                          if(!data.hasData || data.hasError){
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            );
                          }else{
                            final list = data.data;
                            return ListView.builder(
                                itemCount: data.data!.length,
                                itemBuilder: (context,index){
                                  return Card(
                                    elevation: 0.0,
                                    child: ListTile(
                                      title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            list![index].name
                                        ),
                                      ),

                                      subtitle: Container(
                                        height: 200.0,
                                        width: MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                            itemCount: list[index].product.length,
                                            scrollDirection: Axis.horizontal,
                                            padding: EdgeInsets.all(5.0),
                                            itemBuilder: (context,subIndex){
                                              return GestureDetector(
                                                onTap: (){
                                                  Navigator.push(
                                                      context, PageTransition(type: PageTransitionType.rightToLeft,
                                                      child: ProductDetail(productElement: list[index].product[subIndex],),
                                                      isIos: true,
                                                  ));

                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 100.0,
                                                      width: 100.0,
                                                      padding: EdgeInsets.all(8.0),
                                                      margin: EdgeInsets.all(8.0),
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: CachedNetworkImageProvider(
                                                                list[index].product[subIndex].imageName,
                                                              ),
                                                              fit: BoxFit.fill
                                                          )
                                                      ),
                                                      child: Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Container(
                                                          height: 20.0,
                                                          width: 30.0,
                                                          margin: EdgeInsets.all(5.0),
                                                          child: Center(
                                                            child: Text(
                                                                list[index].product[subIndex].priceCode
                                                            ),
                                                          ),
                                                          decoration: BoxDecoration(
                                                            color: Colors.lightBlueAccent,
                                                            borderRadius: BorderRadius.circular(5.0),

                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Align(
                                                        alignment: Alignment.bottomCenter,
                                                        child: Text(
                                                          list[index].product[subIndex].name,
                                                          style: TextStyle(
                                                              fontSize: 12.0
                                                          ),
                                                          softWrap: true,
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 10,

                                                        ),
                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  );
                                });
                          }
                        }
                    ),
                  ),
                ],
              ),
            );
          }
        )

    );
  }
}
