/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This is true even if the object being spread is a user-defined
 * class that implements [Iterable] but isn't even a subtype of List.
 * @description Checks that compile error appears if set spread element does not
 * extends [Iterable].
 * @author iarkh@unipro.ru
 */

main() {
  int i = 1;
  String str = "abs";

  Set s1 = {...{1: 11}};      //# 01: compile-time error
  Set s2 = {1, 2, ...i};      //# 02: compile-time error
  Set s3 = {14, ...str, 28};  //# 03: compile-time error

  Set s4 = {...?{1: 11}};     //# 04: compile-time error
  Set s5 = {1, 2, ...?i};     //# 05: compile-time error
  Set s6 = {14, ...?str, 28}; //# 06: compile-time error
}
