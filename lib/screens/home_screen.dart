import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/widgets/destionation_carousel.dart';
import 'package:flutter_travel_ui/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
    FontAwesomeIcons.volleyballBall,
    FontAwesomeIcons.accessibleIcon,
    FontAwesomeIcons.addressBook,
    FontAwesomeIcons.youtube,
    FontAwesomeIcons.yinYang,
    FontAwesomeIcons.wheelchair,
  ];

  int _selectedIndex = 0;
  int _currentTabIndex = 0;

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        margin: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                "What would you like to find?",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 60.0,
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _icons.length,
                itemBuilder: (context, index) => _buildIcon(index),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            DestionationCarousel(),
            SizedBox(height: 10.0),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz,
                size: 30.0,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              label: "")
        ],
      ),
    );
  }
}
