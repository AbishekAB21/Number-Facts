import 'package:flutter/material.dart';
import 'package:number_facts/api/apis.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final number_controller = TextEditingController();
  String _fact = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: number_controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter a number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async{
                  final number = number_controller.text ?? 'No number provided';
                  final result = await getNumberFact(number: number);
                  
                  setState(() {
                    _fact = result.text ?? "No fact found" ;
                  });
                  number_controller.clear();
                },
                child: Text("Get Fact")),
            SizedBox(
              height: 10,
            ),
            Text(
              _fact,
            )
          ],
        ),
      ),
    );
  }
}
