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
 * @description Check that if legacy class extends opted-in class, legacy setter
 * can accept non-null values if corresponding parent setter is of both nullable
 * or non-nullable type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class A1 extends A {
  void set set_field1(String str) {
    Expect.equals("legacy", str);
  }

  void set set_field2(String str) {
    Expect.equals("legacy", str);
  }
}

main() {
  A1().set_field1 = "legacy";
}
