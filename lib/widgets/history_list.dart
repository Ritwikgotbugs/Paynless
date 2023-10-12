import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            tileColor: Colors.grey[800],
            title: Text('Butty',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.grey[600],
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            trailing: Text(
              "-₹100",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
