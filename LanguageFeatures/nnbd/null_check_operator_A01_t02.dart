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
 * v, throws a runtime error if v is null. Test function type
 * @author sgrekhov@unipro.ru
 * @issue 39723
 * @issue 39724
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

Object? foo(int i) => null;
Object? bar<T>(T t) => null;

main() {
  Function? f1 = null;
  Expect.throws(() {f1!(42);});
  f1 = foo;
  if (f1 != null) {
    Expect.throws(() {
      f1(42)!;
    });
  }

  Function f2 = null;
  Expect.throws(() {f2<int>!(42);});
  f2 = bar;
  if (f2 != null) {
    Expect.throws(() {f2<int>(42)!;});
  }
}
