import 'package:flutter/material.dart';

void main() {
  runApp(RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate Residual Engine',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeTab(),
    AnalyzeTab(),
    PortfolioTab(),
    ReportsTab(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Estate Residual Engine'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analyze'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'Portfolio'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Reports'),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Screen'));  
  }
}

class AnalyzeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Analyze Screen'));  
  }
}

class PortfolioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Portfolio Screen'));  
  }
}

class ReportsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Reports Screen'));  
  }
}