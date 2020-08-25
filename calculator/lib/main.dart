import 'package:calculator/button.dart';
import 'package:calculator/constant.dart';
import 'package:calculator/my_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0';
  List<String> history = [];

  void calculate(String input) {
    MyCalculator calculator = MyCalculator();
    input = input == 'x' ? '*' : input;
    switch (input) {
      case 'C':
        result = '0';
        break;
      case '=':
        result = calculator.calculate(result);
        break;
      default:
        if (result.startsWith('0'))
          result = input;
        else
          result += input;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Text('2 x 50 x 3'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          result,
                          style: kResultText,
                        ),
                        Divider(
                          color: Colors.black45,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton(text: 'C'),
                          _buildButton(text: '+/-'),
                          _buildButton(text: '%'),
                          _buildButton(text: '/', color: Color(0xFFDD6A6C)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton(text: '7'),
                          _buildButton(text: '8'),
                          _buildButton(text: '9'),
                          _buildButton(text: 'x', color: Color(0xFFDD6A6C)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton(text: '4'),
                          _buildButton(text: '5'),
                          _buildButton(text: '6'),
                          _buildButton(text: '-', color: Color(0xFFDD6A6C)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton(text: '1'),
                          _buildButton(text: '2'),
                          _buildButton(text: '3'),
                          _buildButton(text: '+', color: Color(0xFFDD6A6C)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton(text: '00'),
                          _buildButton(text: '0'),
                          _buildButton(text: '.'),
                          _buildEqualButton(),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({String text, Color color}) {
    return Button(
      text: text,
      color: color,
      onPressed: () => calculate(text),
    );
  }

  Widget _buildEqualButton() {
    return Button(
      text: '=',
      backgroundColor: Color(0xFFDD6A6C),
      color: Colors.white,
      elevation: 3,
      onPressed: () => calculate('='),
    );
  }
}
