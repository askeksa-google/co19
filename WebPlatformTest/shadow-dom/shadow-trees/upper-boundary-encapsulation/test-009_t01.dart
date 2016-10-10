/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * @assertion Upper-boundary encapsulation:
 * no nodes other than shadow root descendants are accessible with shadow root
 * DOM tree accessor methods
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  setEquals(actual,expected,reason) => Expect.setEquals(expected,actual,reason + actual);

  setupBlock(ctx, prefix, root) {
    // create <div id='prefix+_id1' class='cls'><p class='cls'><div id='prefix+_id2' class='cls'></div></p></div> like structure
    // where <p> will be used as shadow host element

    ctx[prefix + '_div1'] = ctx.d.createElement('div');
    ctx[prefix + '_div1'].setAttribute('id', prefix + '_id1');
    ctx[prefix + '_div1'].setAttribute('class', 'cls');

    ctx[prefix + '_p1'] = ctx.d.createElement('p');
    ctx[prefix + '_p1'].setAttribute('class', 'cls');
    ctx[prefix + '_p1'].setAttribute('test', 'A_04_01_09');

    ctx[prefix + '_div2'] = ctx.d.createElement('div');
    ctx[prefix + '_div2'].setAttribute('id', prefix + '_id2');
    ctx[prefix + '_div2'].setAttribute('class', 'cls');
    ctx[prefix + '_div2'].setAttribute('test', 'A_04_01_09');

    root.append(ctx[prefix + '_div1']);
    ctx[prefix + '_div1'].append(ctx[prefix + '_p1']);
    ctx[prefix + '_p1'].append(ctx[prefix + '_div2']);
  };

  setup() {
    dynamic ctx = new DynObject();

    ctx.d = newHtmlDocument();
    setupBlock(ctx, 'd', ctx.d.body);

    ctx.s1 = createSR(ctx.d_p1);
    setupBlock(ctx, 's1', ctx.s1);

    ctx.s2 = createSR(ctx.s1_p1);
    setupBlock(ctx, 's2', ctx.s2);

    Expect.isTrue(ctx.d_div1 != null, 'setup:d_div1');
    Expect.isTrue(ctx.d_div2 != null, 'setup:d_div2');
    Expect.isTrue(ctx.s1_div1 != null, 'setup: s1_div1');
    Expect.isTrue(ctx.s1_div2 != null, 'setup: s1_div2');
    Expect.isTrue(ctx.s2_div1 != null, 'setup: s2_div1');
    Expect.isTrue(ctx.s2_div2 != null, 'setup: s2_div2');

    return ctx;
  };

  // check getElementById
  test(() {
    var ctx = setup();

    assert_equals(ctx.s1.getElementById('d_id1'), null, 'Expected no access to d_div1 from s1.getElementById()');
    assert_equals(ctx.s1.getElementById('d_id2'), null, 'Expected no access to d_div2 from s1.getElementById()');
    assert_equals(ctx.s2.getElementById('d_id1'), null, 'Expected no access to d_div1 from s2.getElementById()');
    assert_equals(ctx.s2.getElementById('d_id2'), null, 'Expected no access to d_div1 from s2.getElementById()');


    assert_equals(ctx.s1.getElementById('s1_id1'), ctx.s1_div1, 'Expected access to s1_div1 form s1.getElementById()');
    assert_equals(ctx.s1.getElementById('s1_id2'), ctx.s1_div2, 'Expected access to s1_div2 form s1.getElementById()');
    assert_equals(ctx.s2.getElementById('s2_id1'), ctx.s2_div1, 'Expected access to s2_div1 form s2.getElementById()');
    assert_equals(ctx.s2.getElementById('s2_id2'), ctx.s2_div2, 'Expected access to s2_div2 form s2.getElementById()');


    assert_equals(ctx.s1.getElementById('s2_id1'), null, 'Expected no access to s2_div1 form s1.getElementById()');
    assert_equals(ctx.s1.getElementById('s2_id2'), null, 'Expected no access to s2_div2 form s1.getElementById()');
    assert_equals(ctx.s2.getElementById('s1_id1'), null, 'Expected no access to s1_div1 form s2.getElementById()');
    assert_equals(ctx.s2.getElementById('s1_id2'), null, 'Expected no access to s1_div2 form s2.getElementById()');

  }, 'A_04_01_09_T04');

  // check querySelector for id
  test(() {
    var ctx = setup();

    assert_equals(ctx.d.querySelector('#s1_id1'), null, 'Expected no access to s1_div1 from d.querySelector()');
    assert_equals(ctx.d.querySelector('#s1_id2'), null, 'Expected no access to s1_div2 from d.querySelector()');
    assert_equals(ctx.d.querySelector('#s2_id1'), null, 'Expected no access to s2_div1 from d.querySelector()');
    assert_equals(ctx.d.querySelector('#s2_id2'), null, 'Expected no access to s2_div1 from d.querySelector()');

    assert_equals(ctx.s1.querySelector('#d_id1'), null, 'Expected no access to d_div1 from s1.querySelector()');
    assert_equals(ctx.s1.querySelector('#d_id2'), null, 'Expected no access to d_div2 from s1.querySelector()');
    assert_equals(ctx.s2.querySelector('#d_id1'), null, 'Expected no access to d_div1 from s2.querySelector()');
    assert_equals(ctx.s2.querySelector('#d_id2'), null, 'Expected no access to d_div1 from s2.querySelector()');

    assert_equals(ctx.d.querySelector('#d_id1'), ctx.d_div1, 'Expected access to d_div1 form d.querySelector()');
    assert_equals(ctx.d.querySelector('#d_id2'), ctx.d_div2, 'Expected access to d_div2 form d.querySelector()');
    assert_equals(ctx.s1.querySelector('#s1_id1'), ctx.s1_div1, 'Expected access to s1_div1 form s1.querySelector()');
    assert_equals(ctx.s1.querySelector('#s1_id2'), ctx.s1_div2, 'Expected access to s1_div2 form s1.querySelector()');
    assert_equals(ctx.s2.querySelector('#s2_id1'), ctx.s2_div1, 'Expected access to s2_div1 form s2.querySelector()');
    assert_equals(ctx.s2.querySelector('#s2_id2'), ctx.s2_div2, 'Expected access to s2_div2 form s2.querySelector()');

    assert_equals(ctx.s1.querySelector('#s2_id1'), null, 'Expected no access to s2_div1 form s1.querySelector()');
    assert_equals(ctx.s1.querySelector('#s2_id2'), null, 'Expected no access to s2_div2 form s1.querySelector()');
    assert_equals(ctx.s2.querySelector('#s1_id1'), null, 'Expected no access to s1_div1 form s2.querySelector()');
    assert_equals(ctx.s2.querySelector('#s1_id2'), null, 'Expected no access to s1_div2 form s2.querySelector()');

  }, 'A_04_01_09_T05');

  //check querySelector for element
  test(() {
    var ctx = setup();

    assert_equals(ctx.d.querySelector('p'), ctx.d_p1, 'Expected access to d_p1 from d.querySelector()');
    assert_equals(ctx.s1.querySelector('p'), ctx.s1_p1, 'Expected access to s1_p1 from s1.querySelector()');
    assert_equals(ctx.s2.querySelector('p'), ctx.s2_p1, 'Expected access to s2_p1 from s2.querySelector()');

  }, 'A_04_01_09_T06');

  // check querySelectorAll for element
  test(() {
    var ctx = setup();

    setEquals(ctx.d.querySelectorAll('p'), [ctx.d_p1], 'Expected access to d_p1 from d.querySelectorAll()');
    setEquals(ctx.s1.querySelectorAll('p'), [ctx.s1_p1], 'Expected access to s1_p1 s1.querySelectorAll');
    setEquals(ctx.s2.querySelectorAll('p'), [ctx.s2_p1], 'Expected access to s2_p1 from s2.querySelectorAll');

  }, 'A_04_01_09_T07');

  // check querySelectorAll for class
  test(() {
    var ctx = setup();

    setEquals(ctx.d.querySelectorAll('.cls'), [ctx.d_div1, ctx.d_p1, ctx.d_div2], 'd.querySelectorAll() return wrong result');
    setEquals(ctx.s1.querySelectorAll('.cls'), [ctx.s1_div1, ctx.s1_p1, ctx.s1_div2], 's1.querySelectorAll() return wrong result');
    setEquals(ctx.s2.querySelectorAll('.cls'), [ctx.s2_div1, ctx.s2_p1, ctx.s2_div2], 's2.querySelectorAll() return wrong result');

  }, 'A_04_01_09_T08');

  //check querySelectorAll with whildcat
  test(() {
    var ctx = setup();

    //setEquals(ctx.d.querySelectorAll('*'), [ctx.d_div1, ctx.d_p1, ctx.d_div2], 'd.querySelectorAll');
    setEquals(ctx.s1.querySelectorAll('*'), [ctx.s1_div1, ctx.s1_p1, ctx.s1_div2], 's1.querySelectorAll(\'*\') return wrong result');
    setEquals(ctx.s2.querySelectorAll('*'), [ctx.s2_div1, ctx.s2_p1, ctx.s2_div2], 's2.querySelectorAll(\'*\') return wrong result');

  }, 'A_04_01_09_T09');

  //check querySelectorAll with attribute value
  test(() {
    var ctx = setup();

    setEquals(ctx.d.querySelectorAll('[test=A_04_01_09]'), [ctx.d_p1, ctx.d_div2], 'd.querySelectorAll(\'[test=A_04_01_09]\') return wrong result');
    setEquals(ctx.s1.querySelectorAll('[test=A_04_01_09]'), [ctx.s1_p1, ctx.s1_div2], 's1.querySelectorAll(\'[test=A_04_01_09]\') return wrong result');
    setEquals(ctx.s2.querySelectorAll('[test=A_04_01_09]'), [ctx.s2_p1, ctx.s2_div2], 's2.querySelectorAll(\'[test=A_04_01_09]\') return wrong result');

  }, 'A_04_01_09_T10');

  //check querySelectorAll with parent-child selection
  test(() {
    var ctx = setup();

    setEquals(ctx.d.querySelectorAll('div:first-child'), [ctx.d_div1, ctx.d_div2], 'd.querySelectorAll(\'div:first-child\') return wrong result');
    setEquals(ctx.s1.querySelectorAll('div:first-child'), [ctx.s1_div2], 's1.querySelectorAll(\'div:first-child\') return wrong result');
    setEquals(ctx.s2.querySelectorAll('div:first-child'), [ctx.s2_div2], 's2.querySelectorAll(\'div:first-child\') return wrong result');

  }, 'A_04_01_09_T11');

  //check querySelectorAll with parent-child selection
  test(() {
    var ctx = setup();

    setEquals(ctx.d.querySelectorAll('div:last-child'), [ctx.d_div2], 'd.querySelectorAll(\'div:last-child\') return wrong result');
    setEquals(ctx.s1.querySelectorAll('div:last-child'), [ctx.s1_div2], 's1.querySelectorAll(\'div:last-child\') return wrong result');
    setEquals(ctx.s2.querySelectorAll('div:last-child'), [ctx.s2_div2], 's2.querySelectorAll(\'div:last-child\') return wrong result');

  }, 'A_04_01_09_T12');

  //check querySelectorAll with parent-child selection
  test(() {
    var ctx = setup();

    setEquals(ctx.d.querySelectorAll('p:only-child'), [ctx.d_p1], 'd.querySelectorAll(\'p:only-child\') return wrong result');
    setEquals(ctx.s1.querySelectorAll('p:only-child'), [ctx.s1_p1], 's1.querySelectorAll(\'p:only-child\') return wrong result');
    setEquals(ctx.s2.querySelectorAll('p:only-child'), [ctx.s2_p1], 's2.querySelectorAll(\'p:only-child\') return wrong result');

  }, 'A_04_01_09_T13');

  //check querySelectorAll with parent-child selection
  test(() {
    var ctx = setup();

    setEquals(ctx.d.querySelectorAll('div:empty'), [ctx.d_div2], 'd.querySelectorAll(\'div:empty\') return wrong result');
    setEquals(ctx.s1.querySelectorAll('div:empty'), [ctx.s1_div2], 's1.querySelectorAll(\'div:empty\') return wrong result');
    setEquals(ctx.s2.querySelectorAll('div:empty'), [ctx.s2_div2], 's2.querySelectorAll(\'div:empty\') return wrong result');

  }, 'A_04_01_09_T14');

  //check querySelectorAll with parent-child selection
  test(() {
    var ctx = setup();

    setEquals(ctx.d.querySelectorAll('p div'), [ctx.d_div2], 'd.querySelectorAll(\'p div\') return wrong result');
    setEquals(ctx.s1.querySelectorAll('p div'), [ctx.s1_div2], 's1.querySelectorAll(\'p div\') return wrong result');
    setEquals(ctx.s2.querySelectorAll('p div'), [ctx.s2_div2], 's2.querySelectorAll(\'p div\') return wrong result');

  }, 'A_04_01_09_T15');

  //check querySelectorAll with parent-child selection
  test(() {
    var ctx = setup();

    setEquals(ctx.d.querySelectorAll('p > div'), [ctx.d_div2], 'd.querySelectorAll(\'p > div\') return wrong result');
    setEquals(ctx.s1.querySelectorAll('p > div'), [ctx.s1_div2], 's1.querySelectorAll(\'p > div\') return wrong result');
    setEquals(ctx.s2.querySelectorAll('p > div'), [ctx.s2_div2], 's2.querySelectorAll(\'p > div\') return wrong result');

  }, 'A_04_01_09_T16');
}
