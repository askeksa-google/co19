/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic firstWhere(bool test(E element), {Object orElse()})
 * If none matches, the result of invoking the orElse function is returned.
 * @description Checks that the [orElse] function is invoked and
 * its result is returned if no element matches [test].
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

main() {
  var count = 0;
  Float32x4 f () {
    count++;
    return pack(0.0);
  }
  var l = new Float32x4List.fromList([pack(1.0), pack(2.0), pack(3.0),
      pack(4.0), pack(5.0), pack(6.0), pack(9.0)]);
  var res = l.firstWhere( (element) => false, orElse: f);
  Expect.equals(1, count);
  Expect.isTrue(equal(pack(.0), res));

  res = l.firstWhere( (element) => element.z > 100.0, orElse: f);
  Expect.equals(2, count);
  Expect.isTrue(equal(pack(.0), res));

  l = new Float32x4List.fromList([]);
  res = l.firstWhere( (element) => true, orElse: f);
  Expect.equals(3, count);
  Expect.isTrue(equal(pack(.0), res));
}
