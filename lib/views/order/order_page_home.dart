import 'package:flutter/material.dart';
import 'package:flutter_zomato/config/constants.dart';

class OrderPageHome extends StatelessWidget {
  const OrderPageHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.location_pin,
          ),
          onPressed: () {},
        ),
        title: Text(
          "6th Block, Koramangala, Bengaluru",
          style: KBoldTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Restaurant name, cuisine, or a dish...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.2,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: optionList
                      .map((data) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                data,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 2,
                                shadowColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                side: BorderSide(
                                  width: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              color: Colors.orange,
                              height: 200,
                              child: Text("home style food!"),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                left: 10,
                                bottom: 10,
                              ),
                              color: Colors.pink,
                              height: 200,
                              child: Text("the best offers"),
                            )
                          ]),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Eat what makes you happy",
                        style: KBoldTextStyle,
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
