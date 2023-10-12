import 'package:flutter/material.dart';

class RadioTile extends StatefulWidget {
  const RadioTile({Key? key}) : super(key: key);

  @override
  _RadioTileState createState() => _RadioTileState();
}

class _RadioTileState extends State<RadioTile> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Logo (Replace with your logo)
              Image.asset('assets/cash.jpg', width: 50, height: 50),
              SizedBox(width: 8),
              // Text
              Text(
                'Google pay',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // Radio Button
          Radio(
            value: true,
            groupValue: _isSelected,
            onChanged: (value) {
              setState(() {
                _isSelected = true;
              });
            },
          ),
          // Proceed Button
          ElevatedButton(
            onPressed: _isSelected ? () => _proceedFunction() : null,
            child: Text('Proceed'),
          ),
        ],
      ),
    );
  }

  void _proceedFunction() {
    // Your code to handle the "Proceed" button click
    print('Proceed button clicked.');
  }
}
