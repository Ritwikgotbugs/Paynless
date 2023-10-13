import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynless/utils/db.dart';
import 'package:paynless/widgets/wallet.dart';

class AddCash extends StatelessWidget {
  const AddCash({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController amount = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Add Money',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: StreamBuilder(
        stream: db
            .from('profiles')
            .select('*')
            .eq("uuid", db.auth.currentUser!.id)
            .single()
            .asStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [
              Image.asset(
                "assets/Wallet.png",
                fit: BoxFit.fill,
                width: Get.size.width,
                height: Get.size.height,
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wallet(
                      wallet: double.parse(snapshot.data!['wallet'].toString()),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Please Enter an amount",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: amount,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                        ),
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed("/payment");
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 12, 83, 141)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Proceed",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28, right: 28, top: 10),
                      child: TextFormField(
                        maxLines: 5,
                        expands: false,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            hintText: "Note:",
                            hintStyle: const TextStyle(color: Colors.black)),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
