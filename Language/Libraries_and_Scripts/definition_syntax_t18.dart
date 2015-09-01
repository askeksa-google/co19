/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion libraryName:
 *    metadata library identifier (‘.’ identifier)* ‘;’
 * ;
 * An explicitly named library begins with the word library (possibly prefaced
 * with any applicable metadata annotations), followed by a qualified identifier
 * that gives the name of the library.
 * @description Checks that it is a compile-time error if the library directive is missing
 * the library name.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */

import "definition_syntax_t18_lib.dart";

main() {
  try {
    var someVar = 0;
  } catch(e) {}
}