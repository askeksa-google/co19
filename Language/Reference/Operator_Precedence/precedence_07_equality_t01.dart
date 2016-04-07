/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Equality         ==                                None           7
 * @description Test that '==' equality operator has precedence (7).
 * Compare with Logical AND '&&' operator (precedence 6). Test that '==' has
 * priority higher than '&&'
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(1 == 1 && 2 == 2);
  Expect.isFalse(1 == 1 && 2 == 3);
}
