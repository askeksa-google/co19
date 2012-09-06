/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error for a class or interface to attempt to extend or implement String.
 * @description Checks that it is a compile-time error for an interface to attempt
 * to extend String.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

interface I extends String {}
class C implements I {}

main() {
  try {
    new C();
  } catch(e) {}
}
