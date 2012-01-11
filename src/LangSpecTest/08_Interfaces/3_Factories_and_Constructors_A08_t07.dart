/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let kI be a constructor declared in an interface I, and let kF be its 
 * corresponding constructor. Then:
 * - It is a static type warning if the type of the nth required formal parameter
 * of kI is not identical to the type of the nth required formal parameter of kF.
 * @description Checks that a mismatch in required parameter types between a default 
 * interface constructor and its corresponding factory constructor results in a static
 * type warning.
 * @static-warning
 * @author vasya
 * @reviewer rodionov
 */

class F {
  factory I(var i, var b, var s) {}
}

interface I default F {
  I(int i, bool b, String s);
}

main() {
  new I(null, null, null);
}

