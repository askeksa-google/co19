/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collection Spec:
 * A [spreadElement] starting with [...?] is a constant element if its
 * expression is constant and it evaluates to [null] or a constant [List], [Set]
 * or [Map] instance originally created by a list, set or map literal. It is a
 * potentially constant element if the expression is potentially constant
 * expression.
 * @description: Checks that constant set spread [...?] element can be constant
 * list or set or [null].
 * @author iarkh@unipro.ru
 */

List l = [];
Set s = {};

const m1 = {1: 1};
Map m2 = {2: 2};

const int i1 = 25;
int i2 = 25;

main() {
  const Set res1 = const {...?l};  //# 01: compile-time error
  const Set res2 = const {...?s};  //# 02: compile-time error
  const Set res3 = const {...?m1}; //# 03: compile-time error
  const Set res4 = const {...?m2}; //# 04: compile-time error
  const Set res5 = const {...?i1}; //# 05: compile-time error
  const Set res6 = const {...?i2}; //# 06: compile-time error
}
