import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rsku/controller/rs_controller.dart';
import 'package:sizer/sizer.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final RsController _rsController = Get.put(RsController());

  final List _bannerList = [
    "https://bpjs-kesehatan.go.id/bpjs/application/modules/post/images/banner_website_kesehatan_adalah_investasi.jpg",
    "https://bpjs-kesehatan.go.id/bpjs/application/modules/post/images/remake_banner-11.jpg",
    "https://bpjs-kesehatan.go.id/bpjs/application/modules/post/images/remake_banner4-02.jpg",
  ];

  Widget _nearbyWidget() {
    Future _refreshFunc() async {
      print("Refreshed nearby widget");
    }

    return RefreshIndicator(
      onRefresh: _refreshFunc,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // Title Rumah Sakit
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rumah Sakit",
                  style: TextStyle(
                    fontSize: 12.0.sp,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Lihat Semua",
                    style: TextStyle(
                      fontSize: 12.0.sp,
                    ),
                  ),
                ),
              ],
            ),
            // Swipe Menu
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => Row(
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          _rsController.changeChoice(Rsfilter.semua),
                      style: ElevatedButton.styleFrom(
                        primary: _rsController.choice == Rsfilter.semua
                            ? Colors.green
                            : Colors.blue,
                      ),
                      child: Text("Semua"),
                    ),
                    SizedBox(width: 2.w),
                    ElevatedButton(
                      onPressed: () =>
                          _rsController.changeChoice(Rsfilter.bpjs),
                      style: ElevatedButton.styleFrom(
                        primary: _rsController.choice == Rsfilter.bpjs
                            ? Colors.green
                            : Colors.blue,
                      ),
                      child: Text("BPJS"),
                    ),
                    SizedBox(width: 2.w),
                    ElevatedButton(
                      onPressed: () =>
                          _rsController.changeChoice(Rsfilter.partner),
                      style: ElevatedButton.styleFrom(
                        primary: _rsController.choice == Rsfilter.partner
                            ? Colors.green
                            : Colors.blue,
                      ),
                      child: Text("Partner"),
                    ),
                    SizedBox(width: 2.w),
                    ElevatedButton(
                      onPressed: () =>
                          _rsController.changeChoice(Rsfilter.terdekat),
                      style: ElevatedButton.styleFrom(
                        primary: _rsController.choice == Rsfilter.terdekat
                            ? Colors.green
                            : Colors.blue,
                      ),
                      child: Text("Terdekat"),
                    ),
                  ],
                ),
              ),
            ),
            // Data Rumah Sakit
            SizedBox(
              height: 30.h,
              child: Obx(
                () => ListView.builder(
                  primary: false,
                  itemCount: _rsController.listRs.length,
                  itemBuilder: (_, idx) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(_rsController.listRs[idx].pic!),
                      ),
                      title: Text(
                          _rsController.listRs[idx].nama ?? 'Tidak ada nama'),
                      subtitle: Text(_rsController.listRs[idx].alamat ??
                          'Tidak ada alamat'),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text("Lihat Detail"),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Banner
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                // pauseAutoPlayOnTouch: true,
              ),
              items: _bannerList.map((link) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.0.w,
                    vertical: 3.5.h,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(link),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                );
              }).toList(),
            ), // Title Klink
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Klinik",
                  style: TextStyle(
                    fontSize: 12.0.sp,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Lihat Semua",
                    style: TextStyle(
                      fontSize: 12.0.sp,
                    ),
                  ),
                ),
              ],
            ),
            // Swipe Menu
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => Row(
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          _rsController.changeChoice(Rsfilter.semua),
                      style: ElevatedButton.styleFrom(
                        primary: _rsController.choice == Rsfilter.semua
                            ? Colors.green
                            : Colors.blue,
                      ),
                      child: Text("Semua"),
                    ),
                    SizedBox(width: 2.w),
                    ElevatedButton(
                      onPressed: () =>
                          _rsController.changeChoice(Rsfilter.bpjs),
                      style: ElevatedButton.styleFrom(
                        primary: _rsController.choice == Rsfilter.bpjs
                            ? Colors.green
                            : Colors.blue,
                      ),
                      child: Text("BPJS"),
                    ),
                    SizedBox(width: 2.w),
                    ElevatedButton(
                      onPressed: () =>
                          _rsController.changeChoice(Rsfilter.partner),
                      style: ElevatedButton.styleFrom(
                        primary: _rsController.choice == Rsfilter.partner
                            ? Colors.green
                            : Colors.blue,
                      ),
                      child: Text("Partner"),
                    ),
                    SizedBox(width: 2.w),
                    ElevatedButton(
                      onPressed: () =>
                          _rsController.changeChoice(Rsfilter.terdekat),
                      style: ElevatedButton.styleFrom(
                        primary: _rsController.choice == Rsfilter.terdekat
                            ? Colors.green
                            : Colors.blue,
                      ),
                      child: Text("Terdekat"),
                    ),
                  ],
                ),
              ),
            ),
            // Data Rumah Sakit
            SizedBox(
              height: 30.h,
              child: Obx(
                () => ListView.builder(
                  primary: false,
                  itemCount: _rsController.listRs.length,
                  itemBuilder: (_, idx) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(_rsController.listRs[idx].pic!),
                      ),
                      title: Text(
                          _rsController.listRs[idx].nama ?? 'Tidak ada nama'),
                      subtitle: Text(_rsController.listRs[idx].alamat ??
                          'Tidak ada alamat'),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text("Lihat Detail"),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _historyWidget() {
    Future _refreshFunc() async {
      print("Refreshed history widget");
    }

    return RefreshIndicator(
      onRefresh: _refreshFunc,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://img.freepik.com/free-vector/empty-concept-illustration_114360-1188.jpg",
              width: 60.w,
            ),
            Text(
              "No history found yet",
              style: TextStyle(
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          bottom: TabBar(
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
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 2.h,
          ),
          child: TabBarView(
            children: [
              _nearbyWidget(),
              _historyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
