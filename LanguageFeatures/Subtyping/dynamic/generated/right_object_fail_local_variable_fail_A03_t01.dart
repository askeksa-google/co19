/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Object: if T1 is Object then:
 *  - if T0 is an unpromoted type variable with bound B then T0 <: T1 iff
 *      B <: Object
 *  - if T0 is a promoted type variable X & S then T0 <: T1 iff S <: Object
 *  - if T0 is FutureOr<S> for some S, then T0 <: T1 iff S <: Object.
 *  - if T0 is S* for any S, then T0 <: T1 iff S <: T1
 *  - if T0 is Null, dynamic, void, or S? for any S, then the subtyping does not
 *      hold (per above, the result of the subtyping query is false).
 *  - Otherwise T0 <: T1 is true.
 * @description Check that if T0 is FutureOr<S> for some S but S is not subtype
 * of Object then T0 is not subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to local variable of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_object_fail_A03.dart and 
 * local_variable_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';
// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class S {}

FutureOr<S?> t0Instance = new Future.value(new S());
Object t1Instance = new Object();

const t1Default = const Object();




class LocalVariableTest {

  LocalVariableTest() {
    Object t1 = forgetType(t0Instance);
  }

  LocalVariableTest.valid() {}

  static staticTest() {
    Object t1 = forgetType(t0Instance);
  }

  test() {
    Object t1 = forgetType(t0Instance);
  }
}

main() {
  bar () {
    Object t1 = forgetType(t0Instance);
  }

  Expect.throws(() {
    Object t1 = forgetType(t0Instance);
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    bar();
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new LocalVariableTest();
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    new LocalVariableTest.valid().test();
  }, (e) => e is TypeError || e is CastError);

  Expect.throws(() {
    LocalVariableTest.staticTest();
  }, (e) => e is TypeError || e is CastError);
}
