import 'package:flutter/material.dart';
import 'package:leave_management_system/applyleavescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Leave Management System',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                          title: Text('Dashboard'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => (Apply_Leave()),
                              ),
                            );
                          },
                          leading: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                          title: Text('Apply for leave'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                          title: Text('Pending Leave Requests'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                          title: Text('Leave Balance'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                          title: Text('My Leave status'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child: Image(
                      image: AssetImage('images/leoforce_icon.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
