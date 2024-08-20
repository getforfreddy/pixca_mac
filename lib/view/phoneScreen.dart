import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixca/view/watchesScreenSample.dart';
import 'accessoriesScreen.dart';


class PhoneSalesSample extends StatefulWidget {
  const PhoneSalesSample({super.key});

  @override
  State<PhoneSalesSample> createState() => _PhoneSalesSampleState();
}

class _PhoneSalesSampleState extends State<PhoneSalesSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Phones",
          style: TextStyle(fontSize: 20.r),
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              // TextButton(onPressed: () {}, child: Text("Phone")),
              TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WatchesSample(),
                          ));
                    });
                  },
                  child: Text("Watches")),
              TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccessoriesSample(),
                          ));
                    });
                  },
                  child: Text("Accessories")),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Sliding Containers",
              style: TextStyle(fontSize: 30.r),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 150.h,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200.w,
                    margin: EdgeInsets.all(2.r),
                    color: Colors.green[50],
                    child: Text("image$index"),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Grid View",
              style: TextStyle(fontSize: 30.r),
            ),
          ),
          SizedBox(
            height: 505,
            // Fixed height for the GridView
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
              ),
              itemCount: 4, // Number of items in the grid
              itemBuilder: (context, index) {
                return Container(
                  width: 400,
                  margin: EdgeInsets.all(8),
                  color: Colors.blue[100],
                  child: Center(
                    child: Text('Grid Item $index',
                        style: TextStyle(color: Colors.white)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Sliding Containers",
              style: TextStyle(fontSize: 30.r),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 150.h,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200.w,
                    margin: EdgeInsets.all(2),
                    color: Colors.green[100],
                    child: Text("image$index"),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Tail",
              style: TextStyle(fontSize: 30.r),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              width: 400.w,
              height: 200.h,
              color: Colors.grey[300],
              child: Center(
                  child: Text(
                "End",
                style: TextStyle(
                  fontSize: 20.r,
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
