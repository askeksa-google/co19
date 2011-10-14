/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new list with the elements of this list that satisfy the predicate [f].
 * @description Checks that ObjectNotClosureException exception is thrown.
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 * @needsreview Undocumented exception. Add checks for other non-closure objects.
 */

typedef bool f(var e);

class A {
  A() {}
}

check(var arg) {
  List<String> a = ["1","2","3"];
  try {
    a.filter(arg);
    Expect.fail("ObjectNotClosureException expected when calling a.every()");
  } catch(ObjectNotClosureException e) {}
}
 
main() {
  
  check(null);

  bool x;
  check(x);
  check(false);
  check(1);
  check("every");
  check(new Promise<f>());
  check([1, 2, 3]);
  check(new A());
}