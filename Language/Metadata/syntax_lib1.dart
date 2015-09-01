/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library syntax_lib1;

class A {
  const A();
}

class B<T> {
  const B();
  const B.b(T t);
}

class Foo {
  const Foo(int x, int y);
}