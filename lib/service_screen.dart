import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculation extends StatefulWidget {
  const Calculation({super.key});

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  String equation = "0";

  String result = "0";
  String expression = "";
  double equationFontsize = 38.0;
  double resultFontsize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
          result = "0";
        }
      } else if (buttonText == "=") {
        equationFontsize = 38.0;
        resultFontsize = 48.0;
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation = result;
          result = "";
        } catch (e) {
          result = "error";
        }
      } else {
        equationFontsize = 48.0;
        resultFontsize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildbutton(
    String buttonText,
    double butttonHeight,
    /*Color buttonColor */
  ) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1 * butttonHeight,
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
        onPressed: () => buttonPressed(buttonText),
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
        title: const Center(
          child: Text("Calculator"),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontsize)),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontsize),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Colors.blue,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildbutton("C", 1),
                        buildbutton("⌫", 1),
                        buildbutton("÷", 1),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton(
                          "7",
                          1,
                        ),
                        buildbutton(
                          "8",
                          1,
                        ),
                        buildbutton(
                          "9",
                          1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton(
                          "4",
                          1,
                        ),
                        buildbutton(
                          "5",
                          1,
                        ),
                        buildbutton(
                          "6",
                          1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton(
                          "3",
                          1,
                        ),
                        buildbutton(
                          "2",
                          1,
                        ),
                        buildbutton(
                          "1",
                          1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton(
                          ".",
                          1,
                        ),
                        buildbutton(
                          " 0",
                          1,
                        ),
                        buildbutton(
                          "0.00 ",
                          1,
                        ),
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
                        buildbutton(
                          "×",
                          1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton(
                          "-",
                          1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton(
                          "+",
                          1,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton(
                          "=",
                          2,
                        ),
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
