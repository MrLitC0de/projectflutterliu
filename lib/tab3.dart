import 'package:flutter/material.dart';

class Tab2 extends StatefulWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> with SingleTickerProviderStateMixin {
  String _selectedText1 = "Euro";
  final TextEditingController _textController = TextEditingController();
  String lira1 = "";
  int tab2 = 1;

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
                tab2 = value == 'Euro' ? 1 : 2;
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
                if (tab2 == 1) {
                  lira1 = (inputValue * 1.09).toString();
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
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Tab2(),
  ));
}
