/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a library to be used in the scope of another library.
 * libraryImport:
 *   metadata import uri (as identifier)? combinator* `;'
 * ;
 * combinator:
 *   show identifierList |
 *   hide identifierList
 * ;
 * identifierList:
 *   identifier (, identifier)*
 * @description Checks that it is a compile-time error when an import directive
 * does not end with semicolon.
 * @compile-error
 * @author vasya
 * @reviewer hlodvig
 * @reviewer msyabro
 * @reviewer rodionov
 */

import "syntax_lib.dart"

main() {
  try {
    someVar = 0;
  } catch(e) {}
}
