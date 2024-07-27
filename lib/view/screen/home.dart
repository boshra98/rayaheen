
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/constant/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp()) ;

    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),

          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(children: [
                  Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Find Product",
                            hintStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.grey[200]),
                      )),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    width: 60,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_active_outlined,
                          size: 30,
                          color: Colors.grey[600],
                        )),
                  )
                ]),
              ),
              Container(
                margin: EdgeInsets.symmetric( vertical: 15),
                child: Stack(children: [
                  Container(
                   alignment: Alignment.center,
                    child: ListTile(
                      title: Text("A summer surprise"  , style: TextStyle(color: Colors.white , fontSize: 20)),
                      subtitle: Text("Cashback 20%"  , style: TextStyle(color: Colors.white , fontSize: 30)),
                    ),
                    height: 150,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ) ,
                  Positioned(
                    top: -20,
                    right: -20,
                    child: Container(height: 160,width: 160,decoration: BoxDecoration(
                        color: AppColor.primaryyColor ,
                        borderRadius: BorderRadius.circular(160)
                    ),),
                  )
                ]),
              ) ,
              SizedBox(
                height: 100,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                  const SizedBox(width: 10),
                  itemCount: controller.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.thirdColor,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10),
                          height: 70,
                          width: 70,
                         // child: SvgPicture.network(
                          //    "${AppLink.imagestCategories}/${controller.categories[index]['categories_image']}",
                           //   color: AppColor.secondColor),
                        ),
                        Text(
                          "${controller.categories[index]['categories_name']}",
                          style: const TextStyle(
                             fontSize: 13, color: AppColor.black),
                        )
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text("Product for you",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10),
                            child: Image.asset(
                              "assets/images/2.png",
                              height: 100,
                              width: 150,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColor.black.withOpacity(0.3),
                                borderRadius:
                                BorderRadius.circular(20)),
                            height: 120,
                            width: 200,
                          ),
                          const Positioned(
                              left: 10,
                              child: Text(
                                "Laptop Surface Go 2",
                                style: TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ))
                        ],
                      );
                    }),
              )
            ],
          )
      )
    );

  }
}
