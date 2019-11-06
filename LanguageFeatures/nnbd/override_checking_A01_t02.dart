/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In an unmigrated library, override checking is done using legacy
 * types. This means that an unmigrated library can bring together otherwise
 * incompatible methods. When choosing the most specific signature during
 * interface computation, all nullability and requiredness annotations are
 * ignored, and the [Never] type is treated as [Null].
 *
 * @description Check that if legacy class extends opted-in class, legacy method
 * can accept [null] arguments if corresponding parent method argument is of
 * both nullable or non-nullable type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class A1 extends A {
  void test_nullable(int i) {
    Expect.isNull(i);
  }
}

class B1 extends B {
  void test_nullable(int i) {
    Expect.isNull(i);
  }
}

class C1 extends C {
  void test_nullable(int i) {
    Expect.isNull(i);
  }
}

main() {
  A1().test_nullable(null);
  B1().test_nullable(null);
  C1().test_nullable(null);
}
