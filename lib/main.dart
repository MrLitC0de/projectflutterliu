import 'package:flutter/material.dart';
import 'tab1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final TextEditingController _textController = TextEditingController();
  String dollar1 = '';
  final String _selectedText1 = "Euro";
  int tab1 = 1;

  final TextEditingController _textController1 = TextEditingController();
  String euro1 = '';
  String _selectedText2 = "Dollar";
  int tab2 = 1;

  final TextEditingController _textController2 = TextEditingController();
  String lira1 = '';
  String _selectedText3 = "Euro";
  int tab3 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: const Text('Currency Converter'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.currency_exchange), text: 'Dollar'),
            Tab(icon: Icon(Icons.currency_pound), text: 'Euro'),
            Tab(icon: Icon(Icons.currency_lira), text: 'Lira'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab1
          const Tab1(),
          // Tab2
          Column(
            children: [
              DropdownButton(
                iconSize: 42.0,
                iconEnabledColor: Colors.deepPurple,
                isExpanded: true,
                value: _selectedText2,
                items: const [
                  DropdownMenuItem(value: "Lira", child: Text("Lira")),
                  DropdownMenuItem(value: "Dollar", child: Text("Dollar")),
                ],
                onChanged: (String? value) {
                  setState(() {
                    _selectedText2 = value!;
                    tab2 = value == 'Lira' ? 1 : 2;
                  });
                },
              ),
              TextField(
                controller: _textController1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Value of currency',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController1.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    var inputValue = int.tryParse(_textController1.text) ?? 0;
                    if (tab2 == 1) {
                      euro1 = (inputValue / 100000).toString();
                    } else {
                      euro1 = (inputValue / 1.09).toString();
                    }
                  });
                },
                color: Colors.deepPurple,
                child: const Text(
                  'CONVERT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                euro1,
                style: const TextStyle(fontSize: 30),
              ),
              const Image(
                image: NetworkImage(
                  'https://www.shutterstock.com/shutterstock/photos/2230441735/display_1500/stock-photo--euro-banknote-close-up-yellow-background-for-business-finance-topics-world-money-concept-2230441735.jpg',
                ),
              ), //https://www.shutterstock.com/shutterstock/photos/2230441735/display_1500/stock-photo--euro-banknote-close-up-yellow-background-for-business-finance-topics-world-money-concept-2230441735.jpg
            ],
          ),
          // Tab3
          Column(
            children: [
              DropdownButton(
                iconSize: 42.0,
                iconEnabledColor: Colors.deepPurple,
                isExpanded: true,
                value: _selectedText3,
                items: const [
                  DropdownMenuItem(value: "Euro", child: Text("Euro")),
                  DropdownMenuItem(value: "Dollar", child: Text("Dollar")),
                ],
                onChanged: (String? value) {
                  setState(() {
                    _selectedText3 = value!;
                    tab3 = value == 'Euro' ? 1 : 2;
                  });
                },
              ),
              TextField(
                controller: _textController2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Value of currency',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController2.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    var inputValue = int.tryParse(_textController2.text) ?? 0;
                    if (tab3 == 1) {
                      lira1 = (inputValue * 100000).toString();
                    } else {
                      lira1 = (inputValue * 89000.7).toString();
                    }
                  });
                },
                color: Colors.deepPurple,
                child: const Text(
                  'CONVERT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                lira1,
                style: const TextStyle(fontSize: 30),
              ),
              const Image(
                image: NetworkImage(
                  'https://blogbaladi.com/wp-content/uploads/2020/05/lira-bills-750x420.jpg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
