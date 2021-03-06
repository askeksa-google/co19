/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply
 * to methods apply to abstract methods.
 * It is a compile error if an instance method m1 overrides an instance member
 * m2 and m1 does not declare all the named parameters declared by m2.
 * @description Checks that a compile error is produced when the overriding
 * non-abstract instance method has fewer named parameters than the abstract
 * method being overridden.
 * @compile-error
 * @author rodionov
 */
import "../../../Utils/expect.dart";

abstract class A {
  f({var x, var y, var z});
}

class C extends A {
  f({var x, var z}) {}
}

main() {
  A c = new C();
  c.f(x: 1, z: 2);

  Expect.throws(() => c.f(x: 1, y: 2, z: 3));
}
