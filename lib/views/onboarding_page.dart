import 'package:flutter/material.dart';
import 'package:flutter_dunzo_mvp/controllers/onboarding_controller.dart';
import 'package:flutter_dunzo_mvp/views/products/product_list_page.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.onBoardingPageIndex,
                itemCount: _controller.onBoardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          _controller.onBoardingPages[index].imageAsset),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        _controller.onBoardingPages[index].title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64),
                        child: Text(
                          _controller.onBoardingPages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _controller.onBoardingPages.length,
                          (index) => Obx(() {
                            return Container(
                              margin: EdgeInsets.all(6),
                              width: 30,
                              height: 4,
                              decoration: BoxDecoration(
                                color: _controller.onBoardingPageIndex.value ==
                                        index
                                    ? Colors.red
                                    : Colors.grey,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(40),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ));
                }),
            Positioned(
              right: 50,
              top: 80,
              child: Obx(() {
                return GestureDetector(
                  onTap: _controller.getToLastPage,
                  child: Text(
                    _controller.isLastPage ? "" : "Skip",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              }),
            ),
            Positioned(
              bottom: 10,
              left: 45,
              child: Obx(() {
                return _controller.isLastPage
                    ? TextButton(
                        onPressed: () {
                          print("ON last page");
                          // Get.to(HomePage());
                          Get.to(() => ProductListPage());
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      )
                    : Container();
              }),
            )
          ],
        ),
      ),
    );
  }
}
