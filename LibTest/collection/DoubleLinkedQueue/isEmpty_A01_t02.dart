/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isEmpty
 * @description Checks that isEmpty is read-only property and cannot be changed
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  dynamic queue = new DoubleLinkedQueue();
  Expect.throws(() { queue.isEmpty = 1; }, (e) => e is NoSuchMethodError);
}
