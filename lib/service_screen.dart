import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  const Calculation({super.key});

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  Widget buildbutton(
      String buttonText, double butttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * butttonHeight,
      color: buttonColor,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: const BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid),
            ),
          ),
        ),
        onPressed: null,
        child: Text(
          buttonText,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Colors.green),
        title: const Center(
          child: Text("Calculator"),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: const Text("0", style: TextStyle(fontSize: 38)),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: const Text("0", style: TextStyle(fontSize: 48)),
          ),
          const Expanded(
            child: Divider(
              color: (Colors.green),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildbutton("C", 1, Colors.redAccent),
                        buildbutton("⌫", 1, Colors.green),
                        buildbutton("÷", 1, Colors.green),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("7", 1, Colors.brown.shade400),
                        buildbutton(" 8", 1, Colors.brown.shade400),
                        buildbutton(" 9", 1, Colors.brown.shade400),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("4", 1, Colors.brown.shade400),
                        buildbutton("5", 1, Colors.brown.shade400),
                        buildbutton(" 6", 1, Colors.brown.shade400),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("3", 1, Colors.brown.shade400),
                        buildbutton(" 2", 1, Colors.brown.shade400),
                        buildbutton(" 1", 1, Colors.brown.shade400),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton(".", 1, Colors.brown.shade400),
                        buildbutton(" 0", 1, Colors.brown.shade400),
                        buildbutton("0.00 ", 1, Colors.brown.shade400),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildbutton("×", 1, Colors.brown.shade400),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("-", 1, Colors.brown.shade400),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("+", 1, Colors.brown.shade400),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("=", 2, Colors.brown.shade400),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
