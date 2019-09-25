/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
 * Named Function Types: T0 is U0 Function<X0 extends B00, ..., Xk extends B0k>
 *   (T0 x0, ..., Tn xn, {Tn+1 xn+1, ..., Tm xm})
 *
 * and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ..., Sn yn,
 * {Sn+1 yn+1, ..., Sq yq})
 * and {yn+1, ... , yq} subsetof {xn+1, ... , xm}
 * and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
 * and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
 * and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
 * and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
 * where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
 * @description Check that if {yn+1, ... , yq} is not subsetof {xn+1, ... , xm},
 * then T0 is not a subtype of T1
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is not a subtype of a type T1, then
 * instance of T0 cannot be be assigned to the to global variable of type T1.
 * Assignment to global variable is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from named_function_types_fail_A12.dart and 
 * global_variable_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class U0 extends U1 {}
class U1 {}
class B0 {}
class B1 {}
class V0 {}
class V1 {}
class V2 {}
class V3 {}
class V4 {}
class S0 extends V0 {}
class S1 extends V1 {}
class S2 extends V2 {}
class S3 extends V3 {}
class S4 extends V4 {}

class X0 extends B0 {}
class X1 extends B1 {}

class Y0 extends B0 {}
class Y1 extends B1 {}

typedef T0 = U0 Function<X extends B0, Y extends B1>(V0 x0, V1 x1, {V2? x2, V3? x3, V4? x4});
typedef T1 = U1 Function<X extends B0, Y extends B1>(S0 y0, S1 y1, {S2? x2, S3? x3, S4? x4, V4? x5}); // x2...x5 is not subset of x2...x4

U0 t0Func<X extends B0, Y extends B1>(V0 x0, V1 x1, {V2? x2, V3? x3, V4? x4}) => new U0();
U1 t1Func<X extends B0, Y extends B1>(S0 y0, S1 y1, {S2? x2, S3? x3, S4? x4, V4? x5}) => new U1();

T0 t0Instance = t0Func;
T1 t1Instance = t1Func;

const t1Default = t1Func;




class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = t0Instance; //# 03: compile-time error
  }
  GlobalVariableTest.valid() {}

  foo() {
    t1Instance = t0Instance; //# 04: compile-time error
  }
  static test() {
    t1Instance = t0Instance; //# 05: compile-time error
  }
}

main() {
  t1Instance = t0Instance; //# 01: compile-time error

  bar () {
    t1Instance = t0Instance; //# 02: compile-time error
  }
  bar(); //# 02: compile-time error

  new GlobalVariableTest(); //# 03: compile-time error
  new GlobalVariableTest.valid().foo(); //# 04: compile-time error
  GlobalVariableTest.test(); //# 05: compile-time error
}

