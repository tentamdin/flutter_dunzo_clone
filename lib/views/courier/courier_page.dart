import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/config/constants.dart';
import 'package:flutter_dunzo_mvp/controllers/carousel_controller.dart';
import 'package:flutter_dunzo_mvp/views/courier/courier_tile.dart';
import 'package:flutter_dunzo_mvp/widget/custom_appbar.dart';
import 'package:get/get.dart';

class CourierPage extends StatelessWidget {
  final dailyCarouselController = Get.find<Carousel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
          elevation: 1,
          leadingWidget: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          titleWidget: Text("Fresh Friut",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              )),
          actionWidget: [
            IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          children: [
            CarouselSlider(
              carouselController: dailyCarouselController.carouselController,
              options: CarouselOptions(
                  autoPlay: true,
                  height: 150.0,
                  viewportFraction: 1,
                  onPageChanged: (index, reson) {
                    dailyCarouselController.indicator.value = index;
                  }),
              items: [
                1,
                2,
                3,
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade100,
                        border: Border.all(
                          color: Colors.deepPurpleAccent.shade400,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Keep them ready to go"),
                              Text("Keep them ready to go"),
                            ],
                          ),
                          AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              color: Colors.orange,
                            ),
                          )
                        ],
                      ),
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
              ].asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => dailyCarouselController.carouselController
                      .animateToPage(entry.key),
                  child: Obx(() => Container(
                        width: 8.0,
                        height: 8.0,
                        margin:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 4.0),
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
            CourierTile(
              leadingIconData: Icons.check_circle_outline,
              title: "Pickup address*",
              hintText: "Search pickup location",
              surffixIconData: Icons.search,
            ),
            CourierTile(
              leadingIconData: Icons.trip_origin_outlined,
              title: "Delivery address*",
              hintText: "Search delivery location",
              surffixIconData: Icons.search,
            ),
            CourierTile(
              leadingIconData: Icons.trip_origin_outlined,
              title: "Select package contents*",
              hintText: "e.g. Food, Documents",
              surffixIconData: Icons.arrow_forward_ios_outlined,
            ),
            Divider(
              thickness: 4,
            ),
            TextField(
              enableInteractiveSelection: true,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.rate_review_outlined,
                ),
                hintText: "Any Instructions? Eg: Don't ring the doorbell",
                hintStyle: KGreyTextStyle.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
