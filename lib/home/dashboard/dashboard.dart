import 'package:flutter/material.dart';
import 'package:growpay/home/components/linechart.dart';
import 'package:flutter/services.dart';
import 'package:growpay/home/components/scanner.dart';

const List<Widget> payment = <Widget>[
  Text('Send'),
  Text('Recieve'),
];

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<bool> _selectedPayment = <bool>[true, false];
  bool vertical = false;
  late int ind = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? method;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontFamily: "Oswald",
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => App()));
                        },
                        icon: Icon(
                          Icons.qr_code_scanner,
                          size: 36,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LineChartSample2(),
              SizedBox(
                height: 10,
              ),
              ToggleButtons(
                textStyle: TextStyle(fontFamily: "Oswald"),
                direction: vertical ? Axis.vertical : Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedPayment.length; i++) {
                      _selectedPayment[i] = i == index;
                    }
                    ind = index;
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                selectedBorderColor: Colors.green[700],
                selectedColor: Colors.white,
                fillColor: Colors.green[200],
                color: Colors.green[400],
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: _selectedPayment,
                children: payment,
              ),
              if (ind == 0) ...[
                sendMoney(context),
              ] else ...[
                recieveMoney(context)
              ],
              SizedBox(
                height: 100,
              )
            ]),
      ),
    );
  }
}

Widget sendMoney(BuildContext context) {
  late String email;
  String selectedValue = "Select Contact";
  List<Color> _colors = [Color(0xff02d39a), Color(0xff23b6e6)];
  List<double> _stops = [0.0, 0.7];
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: _colors,
                stops: _stops,
              )),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Send Money",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Oswald",
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton(
                value: selectedValue,
                items: dropdownItems,
                onChanged: (Object? value) {},
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: 'Amount',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Complete Transfer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "Oswald"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget recieveMoney(BuildContext context) {
  late String email;
  String? selectedValue = "Select Contact";
  List<Color> _colors = [Color(0xff02d39a), Color(0xff23b6e6)];
  List<double> _stops = [0.0, 0.7];
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: _colors,
                stops: _stops,
              )),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Request Money",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Oswald",
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton(
                  value: selectedValue,
                  items: dropdownItems,
                  onChanged: (String? newValue) {
                    selectedValue = newValue!;
                  }),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: 'Amount',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Request Money',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "Oswald"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ],
  );
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Select Contact"), value: "Select Contact"),
    DropdownMenuItem(child: Text("Sunveer"), value: "sunveerx@gmail.com"),
    DropdownMenuItem(child: Text("Mohit"), value: "bh.mohit29@gmail.com"),
    DropdownMenuItem(child: Text("Nab"), value: "nabeeluni2028@gmail.com"),
  ];
  return menuItems;
}
