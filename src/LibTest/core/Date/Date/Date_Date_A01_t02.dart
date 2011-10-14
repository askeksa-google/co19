/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds)
 * constructs a [Date] instance based on the individual parts
 * @description Tries to pass null for each argument.
 * @author hlodvig
 * @reviewer iefremov
 * @needsreview
 */

void check(y, m, d, h, min, sec, ms, field) {
  try {
    new Date(y, m, d, h, min, sec, ms);
    Expect.fail("NullPointerException expected with the passed null value of the "+field);
  } catch(NullPointerException ok) {}
}

main(){
  check(null, 1, 1, 1, 1, 1, 1, "year");
  check(1, null, 1, 1, 1, 1, 1, "month");
  check(1, 1, null, 1, 1, 1, 1, "day");
  check(1, 1, 1, null, 1, 1, 1, "hours");
  check(1, 1, 1, 1, null, 1, 1, "minutes");
  check(1, 1, 1, 1, 1, null, 1, "seconds");
  check(1, 1, 1, 1, 1, 1, null, "milliseconds");
}
