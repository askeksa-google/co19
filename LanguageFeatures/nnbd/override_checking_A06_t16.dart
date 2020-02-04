/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a class [C] in an opted-in library implements the same generic
 * class [I] more than once as [I0], .., [In], and at least one of the [Ii] is
 * not syntactically equal to the others, then it is an error if
 * [NNBD_TOP_MERGE(S0, ..., Sn)] is not defined where [Si] is [NORM(Ii)].
 * Otherwise, for the purposes of runtime subtyping checks, [C] is considered to
 * implement the canonical interface given by [NNBD_TOP_MERGE(S0, ..., Sn)].
 *
 * @description Check that error occurs if a class implements the same generic
 * class more than once the [NNBD_TOP_MERGE] of all such super-interfaces are
 * not all syntactically equal and all passes otherwise. Test [Never] type
 * parameter.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "override_checking_A06_opted_out_lib.dart";

class B implements A<Never> {}

class in_Null extends out_Null implements B {}
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class in_int extends out_int implements B {}
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class in_Function extends out_Function implements B {}
//    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class in_Object extends out_Object implements B {}
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class in_dynamic extends out_dynamic implements B {}
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class in_void extends out_void implements B {}
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class in_FutureOr extends out_FutureOr implements B {}
//    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class in_FutureOr_int extends out_FutureOr_FutureOr implements B {}
//    ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class in_FutureOr_FutureOr extends out_FutureOr_int implements B {}
//    ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
