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
  List<String> operators = ['+', '-', '*', '/', '%'];

  void calculate(String input) {
    MyCalculator calculator = MyCalculator();
    // fix expression symbol for multiplication
    input = input == 'x' ? '*' : input;
    // don't allow multiple operators between operands
    for (var o in operators) {
      if ((result.endsWith(o)) && operators.contains(input)) {
        input = '';
        break;
      } else if (result.startsWith('0') && operators.contains(input)) {
        input = '0';
        break;
      }
    }
    // don't allow duplicate dots(.)
    if (result.endsWith('.') && input == '.') input = '';

    try {
      switch (input) {
        case 'C':
          result = '0';
          history = [];
          break;
        case 'del':
          if (!result.startsWith('0'))
            result = result.substring(0, result.length - 1);
          break;
        case '=':
          history.add(result.toString());
          result = calculator.calculate(result);
          break;
        default:
          if (result.startsWith('0') || result == '')
            result = input;
          else
            result += input;
      }
    } catch (e) {
      print(e);
    }

    print(history);
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: history.length > 5 ? 5 : history.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  history[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFFDD6A6C),
                                  ),
                                ),
                              );
                            },
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
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton(text: 'C'),
                          _buildButton(text: 'del'),
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

  Widget _buildButton({String text, Icon icon, Color color}) {
    return Button(
      text: text,
      icon: icon,
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

  List<Widget> _buildHistory(List<String> history) {
    List<Text> items = [];
    for (var item in history) {
      items.add(Text(item));
    }
    return items;
  }
}
