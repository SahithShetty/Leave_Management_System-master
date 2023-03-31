import 'package:flutter/material.dart';

class Apply_Leave extends StatefulWidget {
  const Apply_Leave({Key? key}) : super(key: key);

  @override
  State<Apply_Leave> createState() => _Apply_LeaveState();
}

class _Apply_LeaveState extends State<Apply_Leave> {
  var _leavetype = ['Earned Leave', 'Sick Leave', 'Maternal Leave', 'Others'];
  String _currentItemSelected = 'Sick Leave';
  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2040),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Apply for Leave',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          hint: Text('Select Items:'),
                          value: _currentItemSelected,
                          items: _leavetype.map((String dropDownItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownItem,
                              child: Text(dropDownItem),
                            );
                          }).toList(),
                          onChanged: (newValueSelected) {
                            setState(() {
                              this._currentItemSelected = newValueSelected!;
                            });
                          },
                          //value: _currentItemSelected,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            ///padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              shape: BoxShape.rectangle,
                            ),
                            child: Text(
                              _dateTime.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              )),
                              onPressed: _showDatePicker,
                              child: Text(
                                'From',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              shape: BoxShape.rectangle,
                            ),
                            child: Text(
                              _dateTime.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              )),
                              onPressed: _showDatePicker,
                              child: Text(
                                'To',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No.Of Days: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.grey,
                            height: 25,
                            width: 40,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.15,
                            right: MediaQuery.of(context).size.width * 0.15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            hintText: 'CC Mail to',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            hintText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: null,
                          child: Text(
                            'Submit Request',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              primary:
                                  Colors.black, //background color of button
                              side: BorderSide(
                                  width: 3,
                                  color:
                                      Colors.black54), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.all(
                                  20) //content padding inside button
                              ))
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
