/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The return type of a factory whose signature is of the form
 * factory M or the form factory M.id is M.
 * @description Checks that a static warning is produced when assigning the
 * result of invoking factory constructor M.id to the variable whose type 
 * is not assignable to M.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

class A {
  factory A.bcd() {}
}

main() {
  int a = new A.bcd();
}
