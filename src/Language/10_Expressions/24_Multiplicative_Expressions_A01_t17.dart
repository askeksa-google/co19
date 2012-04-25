/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Multiplicative expressions invoke the multiplication operators on objects.
 * multiplicativeExpression:
 *   unaryExpression (multiplicativeOperator unaryExpression)* |
 *   super (multiplicativeOperator unaryExpression)+
 * ;
 * multiplicativeOperator:
 *   '*' |
 *   '/' |
 *   '%' |
 *   '~/'
 * ;
 * A multiplicative expression is either a unary expression, or an invocation
 * of a multiplicative operator on either super or an expression e1, with argument e2.
 * @description Checks that a type variable can't be used
 * as the right operand of a multiplicative expression.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

class A<T> {
  test() {
    try {1 ~/ T;} catch(var e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
