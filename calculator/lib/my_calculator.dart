import 'package:math_expressions/math_expressions.dart';

class MyCalculator {
  String result = '0';
  Parser parser = Parser();
  ContextModel cm = ContextModel();
  Expression exp;

  String calculate(String res) {
    exp = parser.parse(res);
    result = exp.evaluate(EvaluationType.REAL, cm).toString();
    return result;
  }
}
