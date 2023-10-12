import 'package:flutter/material.dart';

class KButton extends StatelessWidget {
  final String text;
  final Function onpressed;
  const KButton({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () {
            onpressed();
          },
          style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(Colors.lightBlueAccent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
