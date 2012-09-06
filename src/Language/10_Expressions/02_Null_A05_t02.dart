/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Invoking a method on null yields a NullPointerException unless the 
 * method is explicitly implemented by class Null.
 * @description Checks that invoking a method on null yields NullPointerException
 * if the class Null does not explicitly implement it.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer rodionov
 */

class A {
  int aMethodWithAFancyName() {}
}

main() {
  try{
    A a = null;
    int x = a.aMethodWithAFancyName(); 
    Expect.fail("Invoking method on null should yield NullPointerException");
  } on NullPointerException catch(ok){}
}
