/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num clamp(num lowerLimit, num upperLimit)
 * Returns this num clamped to be in the range lowerLimit-upperLimit.
 * The comparison is done using compareTo and therefore takes -0.0 into account.
 * This also implies that double.nan is treated as the maximal double value.
 * @description Checks that returns num clamped to be in the range
 * lowerLimit-upperLimit, where one of the limits is 0.0 or -0.0
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(num expected, num lowerLimit, num upperLimit, num value) {
  Expect.equals(expected, value.clamp(lowerLimit, upperLimit));
}

main() {
  check(0.0, -0.0, 0.0, 0.5);
  check(-0.0, -0.0, 0.0, -0.5);
}
