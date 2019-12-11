/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form e! evaluates e to a value v, throws a
 * runtime error if v is null, and otherwise evaluates to v.
 *
 * @description Check that an expression of the form e! evaluates e to a value
 * v, throws no runtime error if v is not null. Test 'this'
 * @author sgrekhov@unipro.ru
 * @issue 39723
 * @issue 39598
 */
// SharedOptions=--enable-experiment=non-nullable

class A {
  foo() {}
  Object? get getValue => "Lily was here";
  int? operator [](int index) => index;

  test() {
    this!;          //# 01: static type warning
    this!.foo();    //# 02: static type warning
    this![42];      //# 03: static type warning
    this!?.foo();   //# 04: static type warning
    this!?.[42];    //# 05: static type warning
    this.getValue!;
    this[42]!;
  }
}

main() {
  A a = new A();
  a.test();
}
