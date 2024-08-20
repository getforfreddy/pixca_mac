import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixca/view/myAddressScreen.dart';
import 'package:pixca/view/profileScreen.dart';
import 'about.dart';
import 'helpAndSupport.dart';
import 'notificationscreen.dart';

class SettingsSample extends StatefulWidget {
  const SettingsSample({super.key});

  @override
  State<SettingsSample> createState() => _SettingsSampleState();
}

class _SettingsSampleState extends State<SettingsSample> {
  late TextEditingController phoneController;
  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController(); // Initialize phoneController here
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Settings")),
      ),
      body: Column(
        children: [
          Card(
            elevation: 3,
            child: Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileSample(),
                      ));
                },
                leading: Icon(Icons.person_rounded),
                title: Text("Account"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
          ),
          Card(
            elevation: 3,
            child: Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationSample(),
                      ));
                },
                leading: Icon(Icons.notifications_none),
                title: Text("Notification"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
          ),
          Card(
            elevation: 3,
            child: Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpandSupportSample(),
                      ));
                },
                leading: Icon(Icons.headphones),
                title: Text("Help and Support"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
          ),

          Card(
            elevation: 3,
            child: Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyAddressSample(),
                      ));
                },
                leading: Icon(Icons.location_on_outlined),
                title: Text("Saved address"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
          ),
          Card(
            elevation: 3,
            child: Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(),
                      ));
                },
                leading: Icon(Icons.question_mark),
                title: Text("About"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
