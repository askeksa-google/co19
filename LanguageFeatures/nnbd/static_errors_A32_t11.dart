/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
 * or ...?) on an expression of type T if T is strictly non-nullable.
 *
 * @description Check it is a warning to use a null aware operator (?., ?.., ??,
 * ??=, or ...?) on a non-nullable receiver. Test FutureOr<T>, where
 * <T extends Object>
 * @author sgrekhov@unipro.ru
 * @issue 39598
 * @issue 39714
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";

test<T extends Object>(FutureOr<T> t) {
  t?.toString();                                  //# 01: static type warning
  t?..toString();                                 //# 02: static type warning
  t ?? t;                                         //# 03: static type warning
  t ??= t;                                        //# 04: static type warning
  List<FutureOr<T>> clist = [t, t];
  List<FutureOr<T>> alist = [t, t, ...? clist];       //# 05: static type warning
}

main() {
  test<FutureOr<String>>("Lily was here");
}
