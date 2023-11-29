import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> with SingleTickerProviderStateMixin {
  String _selectedText1 = "Euro";
  final TextEditingController _textController = TextEditingController();
  String dollar1 = "";
  int tab1 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DropdownButton(
            iconSize: 42.0,
            iconEnabledColor: Colors.deepPurple,
            isExpanded: true,
            value: _selectedText1,
            items: const [
              DropdownMenuItem(value: "Euro", child: Text("Euro")),
              DropdownMenuItem(value: "Lira", child: Text("Lira")),
            ],
            onChanged: (String? value) {
              setState(() {
                _selectedText1 = value!;
                tab1 = value == 'Euro' ? 1 : 2;
              });
            },
          ),
          TextField(
            controller: _textController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter Value of currency',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  _textController.clear();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                var inputValue = int.tryParse(_textController.text) ?? 0;
                if (tab1 == 1) {
                  dollar1 = (inputValue * 1.09).toString();
                } else {
                  dollar1 = (inputValue * 89000.7).toString();
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
            dollar1,
            style: const TextStyle(fontSize: 30),
          ),
          const Image(
            image: NetworkImage(
              'https://thumbs.dreamstime.com/z/dreamy-young-cute-girl-imaging-things-wanting-find-true-love-dont-care-money-attractive-alluring-woman-looking-up-thoughtful-202742739.jpg?w=992',
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Tab1(),
  ));
}
