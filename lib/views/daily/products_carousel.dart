import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/constants.dart';
import 'package:flutter_dunzo_mvp/controllers/carousel_controller.dart';
import 'package:get/get.dart';

class ProductsCarosuel extends StatelessWidget {
  final dailyCarouselController = Get.put(Carousel());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Most Popular",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                "VIEW ALL",
                style: TextStyle(
                  color: Colors.greenAccent.shade700,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          CarouselSlider(
            carouselController: dailyCarouselController.carouselController,
            options: CarouselOptions(
                height: 300.0,
                viewportFraction: 1,
                onPageChanged: (index, reson) {
                  dailyCarouselController.indicator.value = index;
                }),
            items: [
              1,
              2,
              3,
              4,
              5,
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.only(top: 10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: productList
                        .sublist(0, 6)
                        .map(
                          (product) => GestureDetector(
                            onTap: () {},
                            child: GridTile(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 50,
                                    margin: EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.indigoAccent,
                                    ),
                                    child: Text(
                                      'text $i',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  Text(
                                    "Product name",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              footer: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "1kg",
                                    style: KGreyTextStyle,
                                  ),
                                  Text(
                                    "\u{20B9} 50",
                                    style: KProductBoldStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              1,
              2,
              3,
              4,
              5,
            ].asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => dailyCarouselController.carouselController
                    .animateToPage(entry.key),
                child: Obx(() => Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.shade900.withOpacity(
                              dailyCarouselController.indicator.value ==
                                      entry.key
                                  ? 1
                                  : 0.4)),
                    )),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
