import 'package:flutter/material.dart';
import 'package:growpay/home/components/assetsdata.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> itemsData = [];
  void getPostsData() {
    List<dynamic> responseList = HISTORY_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$ ${post["price"]}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: post["color"]),
                ),
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Text(
              "Transaction History",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontFamily: "Oswald",
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  controller: controller,
                  itemCount: itemsData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    double scale = 1.0;
                    if (topContainer > 0.5) {
                      scale = index + 0.5 - topContainer;
                      if (scale < 0) {
                        scale = 0;
                      } else if (scale > 1) {
                        scale = 1;
                      }
                    }
                    return Opacity(
                      opacity: scale,
                      child: Transform(
                        transform: Matrix4.identity()..scale(scale, scale),
                        alignment: Alignment.bottomCenter,
                        child: Align(
                            heightFactor: 0.7,
                            alignment: Alignment.topCenter,
                            child: itemsData[index]),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
