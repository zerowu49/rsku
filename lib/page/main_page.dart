import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rsku/controller/rs_controller.dart';
import 'package:rsku/page/home_page.dart';
import 'package:rsku/page/klinik_page.dart';
import 'package:rsku/page/profile_page.dart';
import 'package:rsku/page/rs_page.dart';
import 'package:sizer/sizer.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final RsController _rsController = Get.put(RsController());
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  List _pages = [
    HomePage(),
    RsPage(),
    KlinikPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    _rsController.changeChoice(Rsfilter.semua);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                "assets/logo.png",
                height: 5.h,
              ),
              SizedBox(width: 5.w),
              Text(
                "Valbury",
                style: TextStyle(
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                EasyLoading.showToast("This feature will be available soon");
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ],
          bottom: _selectedNavbar == 0
              ? TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "Nearby",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "History",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              : null,
        ),
        body: _pages.elementAt(_selectedNavbar),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hotel),
              label: 'RS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: 'Klinik',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedNavbar,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: _changeSelectedNavBar,
        ),
      ),
    );
  }
}
