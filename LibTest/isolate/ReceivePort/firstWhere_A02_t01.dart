/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> firstWhere (bool test(T element), {
 * @deprecated dynamic defaultValue(), T orElse()})
 *
 * Finds the first element of this stream matching test.
 *
 * Returns a future that is completed with the first element of this stream that
 * test returns true for.
 *
 * If no such element is found before this stream is done, and a orElse function
 * is provided, the result of calling orElse becomes the value of the future. If
 * orElse throws, the returned future is completed with that error.
 *
 * If this stream emits an error before the first matching element, the returned
 * future is completed with that error, and processing stops.
 *
 * Stops listening to the stream after the first matching element or error has
 * been received.
 *
 * Internally the method cancels its subscription after the first element that
 * matches the predicate. This means that single-subscription (non-broadcast)
 * streams are closed and cannot be reused after a call to this method.
 *
 * If an error occurs, or if this stream ends without finding a match and with
 * no orElse function provided, the returned future is completed with an error.
 *
 * The defaultValue parameter is deprecated, and orElse should be used instead.
 * @description Checks that if this stream ends without finding a match and a
 * [orElse] function is provided, the result of calling [orElse]
 * becomes the value of the future.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(Iterable data, bool test(var element), int expected) {
  Stream s = IsolateStream.fromIterable(data);
  asyncStart();
  Future<int> f = s.firstWhere(test, orElse: () => expected);
  f.then((int actual) {
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([], (var element) => true, 1);
  check([1, 2, 3], (var element) => element == null, null);
  check(new Iterable.generate(0, (int index) => index), (var element) => false,
      0);
  check(
      new Iterable.generate(0, (int index) => index), (var element) => true, 0);
  check(new Iterable.generate(10, (int index) => index), (var element) => false,
      22);
  check(new Iterable.generate(10, (int index) => index * 5),
      (var element) => element < 0, 33);
}
