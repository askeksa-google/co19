/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if generic function typedef [Never] type parameter is
 * exported from opted-in library to legacy library and then back to the opted
 * in code, typedef retains its status. Typedef is in the form [typedef <type>
 * <identifier> <formalParameterPart>]. Check function with argument.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

typedef expected = void Function(Never);

main() {
  Expect.equals(expected, g_def1_never_arg);
}
