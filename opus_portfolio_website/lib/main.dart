import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ScrollController _scrollController = ScrollController();
  bool _isDarkMode = false;

  void _scrollToSection(double position) {
    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isDarkMode ? Colors.grey[900] : Colors.grey[100];
    final textColor = _isDarkMode ? Colors.white : Colors.black;

    return MaterialApp(
      title: 'My Website',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => _scrollToSection(0),
                child: Text(
                  'Home',
                  style: TextStyle(color: textColor),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () => _scrollToSection(500),
                child: Text(
                  'About',
                  style: TextStyle(color: textColor),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () => _scrollToSection(1000),
                child: Text(
                  'Experience',
                  style: TextStyle(color: textColor),
                ),
              ),
                            SizedBox(width: 20),

              IconButton(
              onPressed: _toggleDarkMode,
              icon: Icon(
                _isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                color: textColor,
              ),
            ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
            Column(
            children: [
              // Section 1: Photo and Text
              Container(
                height: 750,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Christopher Avakian',
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.code, size: 50, color: textColor),
                        Icon(Icons.link, size: 50, color: textColor),
                        Icon(Icons.mail, size: 50, color: textColor),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Section 3: About
              Container(
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('assets/my_photo.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod, nulla sit amet aliquam lacinia, nisl nisl aliquam nisl, nec aliquam nisl nisl sit amet nisl. Nullam euismod, nulla sit amet aliquam lacinia, nisl nisl aliquam nisl, nec aliquam nisl nisl sit amet nisl.',
                        style: TextStyle(fontSize: 18, color: textColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Section 4: Experience
              Container(
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Education:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Experience:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bachelor of Science in Computer Science\nXYZ University\nGraduation Date: May 2023',
                            style: TextStyle(fontSize: 18, color: textColor),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Software Engineer Intern\nABC Company\nJune 2022 - August 2022',
                            style: TextStyle(fontSize: 18, color: textColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          )
          ),
        ),
      ),
    );
  }
}
