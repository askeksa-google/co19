/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let [G] be a generic class or parameterized type alias with formal
 * type parameter declarations [F1] .. [Fk] containing formal type parameters
 * [X1] .. [Xk] and bounds [B1] .. [Bk]. We say that the formal type parameter
 * [Xj] has a simple bound when one of the following requirements is satisfied:
 * [Bj] is omitted.
 * [Bj] is included, but does not contain any of [X1] .. [Xk]. If [Bj] contains
 * a type [T] on the form qualified (for instance, [C] or [p.D]) which denotes a
 * generic class or parameterized type alias [G1] (that is, [T] is a raw type),
 * every type argument of [G1] has a simple bound.
 * @description Checks that simple bounds are correct for [typedef] with [X
 * extends FutureOr] parameter (invariant)
 * @author iarkh@unipro.ru
 */
import "dart:async";

// Functions for correct type comparison in language feature tests
typedef F<X> = void Function<Y extends X>();
F<X> toF<X>(X x) => null;

typedef G<X extends FutureOr> = X Function(X);

main() {
  G source;
  var fsource = toF(source);
  F<G<FutureOr<dynamic>>> target = fsource;
  F<G<FutureOr<Null>>> targetq = fsource;    //# 01: compile-time error
}
