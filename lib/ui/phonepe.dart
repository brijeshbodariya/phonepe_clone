import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_clone/model/image_slider_model.dart';
import 'package:phonepe_clone/model/list_pay_model.dart';

class FlutterDevs extends StatefulWidget {
  const FlutterDevs({Key? key}) : super(key: key);

  @override
  _FlutterDevsState createState() => _FlutterDevsState();
}

class _FlutterDevsState extends State<FlutterDevs> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: _bodyItem(),
        bottomNavigationBar: _bottemTab());
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 124),
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/outline_account_circle.png",
                color: Colors.white,
                height: 40,
                width: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Your Location',
                      style: TextStyle(fontSize: 10),
                    ),
                    Row(children: const <Widget>[
                      Text(
                        'Noida',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: Image.asset(
                "assets/outline_qrscan.png",
                color: Colors.white,
                height: 24,
                width: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: Image.asset(
                "assets/notifications.png",
                color: Colors.white,
                height: 24,
                width: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 13,
              ),
              child: Image.asset(
                "assets/outline_help.png",
                color: Colors.white,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
      ],
      elevation: 0,
    );
  }

  Widget _bottemTab() {
    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/stores.png",
                height: 19.5,
                width: 19.5,
              ),
              label: 'Stores'),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/placeholder.png",
                height: 19.5,
                width: 19.5,
              ),
              label: 'Apps'),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/rupee.png",
                height: 19.5,
                width: 19.5,
              ),
              label: 'My Money'),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/history.png",
                height: 19.5,
                width: 19.5,
              ),
              label: 'History'),
        ]);
  }

  Widget _bodyItem() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            color: Colors.amber[50],
            child: const Padding(
              padding: EdgeInsets.only(left: 13, top: 13, bottom: 8),
              child: Text(
                'Make the most of your Flutter Devs account',
                style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              Container(
                height: 95,
                color: Colors.amber[50],
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  scrollDirection: Axis.horizontal,
                  itemCount: _getListPayList().length,
                  itemBuilder: (context, index) {
                    return ListPay(_getListPayList()[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Divider(
            color: Colors.grey[400],
            height: 1,
          ),
        ),
        SliverToBoxAdapter(
            child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.width / 3.0,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 13),
                child: CarouselSlider(
                  items: carouselSliderList(_getImageSliderList()),
                  options: CarouselOptions(
                    aspectRatio: 2,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    pauseAutoPlayOnTouch: true,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                        log('$_currentIndex');
                      });
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5.0,
              right: 0.0,
              left: 0.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (int index) {
                  return dots(_currentIndex, index);
                }),
              ),
            ),
          ],
        )),
        SliverToBoxAdapter(
          child: Container(
            child: const Text(
              'Money Transfers',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            padding: const EdgeInsets.only(left: 15, top: 10, bottom: 13),
          ),
        ),
        SliverToBoxAdapter(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                height: 85,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _getMoneyTransferList().length,
                    itemBuilder: (context, index) {
                      return MoneyTransfer(_getMoneyTransferList()[index]);
                    }),
              ),
            ),
          ],
        )),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
            child: Divider(
              color: Colors.grey[700],
              height: 1,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 9,
              top: 15,
            ),
            child: SizedBox(
              height: 90,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _getSentMoneyList().length,
                  itemBuilder: (context, index) {
                    return SentMoney(_getSentMoneyList()[index]);
                  }),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.grey[100],
            height: 120,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/banking.png",
//                          color: Colors.pink[700],
                        width: 40,
                        height: 40,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          'View All\nOffers',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset("assets/suggestions_strip.png"),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/ic_menu_invite.png",
                        color: Colors.orange[700],
                        width: 43,
                        height: 43,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          'View My\nRewards',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset("assets/suggestions_strip.png"),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/ic_menu_invite.png",
//                          color: Colors.deepPurple[700],
                        width: 43,
                        height: 43,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          'Refer & Earn\nUp to ₹1000',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            child: const Text(
              'Recharge and Pay Bills',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            padding: const EdgeInsets.only(left: 15, top: 15),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 110.0,
            mainAxisSpacing: 0.5,
            crossAxisSpacing: 0.5,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return GridItem(_getGridItemList()[index]);
            },
            childCount: _getGridItemList().length,
          ),
        ),
      ],
    );
  }

  List<ListPayModel> _getListPayList() {
    List<ListPayModel> list = <ListPayModel>[];
    list.add(ListPayModel("assets/ic_radiofocused.png", "Bank Account Added"));
    list.add(ListPayModel("assets/ic_radiofocused.png", "Wallet\nActivated"));
    list.add(ListPayModel("assets/newgiftcard.png", "Add\nNew Card"));

    list.add(ListPayModel("assets/request_money.png", "Add\nPhoto"));
    list.add(ListPayModel("assets/request_money.png", "Pay"));
    return list;
  }

  List<ListPayModel> _getMoneyTransferList() {
    List<ListPayModel> list = <ListPayModel>[];
    list.add(ListPayModel("assets/request_money.png", "To Contact"));
    list.add(ListPayModel("assets/ic_menu_balance_selected.png", "To Account"));
    list.add(ListPayModel("assets/request_money.png", "To Self"));
    list.add(ListPayModel("assets/request_money.png", "Bank Balance"));
    list.add(ListPayModel("assets/request_money.png", "To Contact"));
    list.add(ListPayModel("assets/request_money.png", "To Contact"));
    list.add(ListPayModel("assets/request_money.png", "To Contact"));
    return list;
  }

  List<ListPayModel> _getSentMoneyList() {
    List<ListPayModel> list = <ListPayModel>[];
    list.add(
        ListPayModel("assets/placeholder_contact_provider.png", "Shreyansh"));
    list.add(
        ListPayModel("assets/placeholder_contact_provider.png", " Self-0471"));
    list.add(ListPayModel("assets/placeholder_contact_provider.png", "veenu"));
    list.add(
        ListPayModel("assets/placeholder_contact_provider.png", "Arunendra"));
    list.add(ListPayModel("assets/placeholder_contact_provider.png", "Arpit"));
    list.add(ListPayModel("assets/placeholder_contact_provider.png", "Rahul"));
    list.add(ListPayModel("assets/placeholder_contact_provider.png", "Aditya"));
    list.add(ListPayModel("assets/placeholder_contact_provider.png", "Mayank"));
    list.add(
        ListPayModel("assets/placeholder_contact_provider.png", "ARRREEF"));
    return list;
  }

  List<ListPayModel> _getGridItemList() {
    List<ListPayModel> list = <ListPayModel>[];
    list.add(ListPayModel("assets/recharge.png", "Recharge"));
    list.add(ListPayModel("assets/dth.png", "DTH"));
    list.add(ListPayModel("assets/electricity.png", "Electricity"));
    list.add(ListPayModel("assets/creditcard.png", "Credit Card"));
    list.add(ListPayModel("assets/postpaid.png", "Postpaid"));
    list.add(ListPayModel("assets/landline.png", "Landline"));
    list.add(ListPayModel("assets/broadband.png", "Broadband"));
    list.add(ListPayModel("assets/gas.png", "Gas"));
    list.add(ListPayModel("assets/water.png", "Water"));
    list.add(ListPayModel("assets/datacard.png", "Datacard"));
    list.add(ListPayModel("assets/insurance.png", "Insurance"));
    list.add(ListPayModel("assets/muncipaltax.png", "Muncipal Tax"));
    list.add(ListPayModel("assets/googleplay.png", "Google Play"));
    list.add(ListPayModel("assets/giftcardd.png", "Buy Gift\nCards"));

    return list;
  }

  List<ImageSliderModel> _getImageSliderList() {
    List<ImageSliderModel> list = <ImageSliderModel>[];
    list.add(ImageSliderModel("assets/ghghgh.jpg"));
    list.add(ImageSliderModel("assets/ghghgh.jpg"));

    return list;
  }

  carouselSliderList(List<ImageSliderModel> getImageSliderList) {
    return getImageSliderList.map((i) {
      return Builder(builder: (BuildContext context) {
        return imageSliderItem(i);
      });
    }).toList();
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget dots(int current, index) {
    if (current != index) {
      return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dotColor(index),
          ));
    } else {
      return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: dotColor(index)));
    }
  }

  Widget imageSliderItem(ImageSliderModel i) {
    return Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: MediaQuery.of(context).size.width / 1.05,
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            i.path,
            fit: BoxFit.fill,

//            width: MediaQuery.of(context).size.width/4,
//            height: MediaQuery.of(context).size.height,
          ),
        ));
  }

  Color dotColor(int index) {
    return _currentIndex == index ? Colors.grey : Colors.black;
  }
}

class ListPay extends StatelessWidget {
  final ListPayModel? listPayModel;

  const ListPay(this.listPayModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          listPayModel!.imagePath,
          color: listPayModel!.color,
          width: 40,
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            listPayModel!.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10.5, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class MoneyTransfer extends StatelessWidget {
  final ListPayModel listpaymodel;

  const MoneyTransfer(this.listpaymodel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          listpaymodel.imagePath,
          color: listpaymodel.color,
          width: 46,
          height: 46,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            listpaymodel.title,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }
}

class SentMoney extends StatelessWidget {
  final ListPayModel listpaymodel;

  const SentMoney(this.listpaymodel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          listpaymodel.imagePath,
          color: listpaymodel.color,
          width: 46,
          height: 46,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            listpaymodel.title,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 11),
          ),
        ),
      ],
    );
  }
}

class GridItem extends StatelessWidget {
  final ListPayModel listPayModel;

  const GridItem(this.listPayModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            listPayModel.imagePath,
            width: 30,
            height: 30,
            color: listPayModel.color,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              listPayModel.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
