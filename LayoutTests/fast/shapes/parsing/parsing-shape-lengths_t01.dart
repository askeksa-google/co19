/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 */
import "dart:html";
import "../../../testharness.dart";
import "parsing-test-utils.dart";

const String htmlEL1 = r'''
<style>
* { font-size: 16px; }
div { font-size: 8px; }
</style>
''';

void main() {
    description('Test that basic shapes accept different length units');
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());

// The test functions and globals used here are defined parsing-test-utils.js.

String getStyleValue(property, value) {
    var div = document.createElement("div");
    div.style.setProperty(property, value);
    return div.style.getPropertyValue(property);
}

void testStyleValue(value, expected) {
    shouldBe(getStyleValue("shape-outside", value), expected, "testStyleValue($value, $expected)");
}

void testComputedStyleValue(value, expected) {
    testShapeComputedProperty("shape-outside", value, expected);
}

void testInvalidValue(property, value) {
    testStyleValue(value, null); // fails; works with expected="".
    testComputedStyleValue(value, 'none');
}

// absolute lengths - number serialization, units
testStyleValue("circle(0 at 0 0)", "circle(0px at 0% 0%)");
testStyleValue("circle(1px at +1px -1px)", "circle(1px at 1px -1px)");
testStyleValue("circle(1.5px at -1.5px +1.5px)", "circle(1.5px at -1.5px 1.5px)");
testStyleValue("circle(.5px at -.5px +.5px)", "circle(0.5px at -0.5px 0.5px)");

testStyleValue("inset(1cm 1mm 1in 1px round 1pt 1pc)", "inset(1cm 1mm 1in 1px round 1pt 1pc)");
testStyleValue("inset(-1px 1px 1px 1px round 1px 1px 1px 1px)", "inset(-1px 1px 1px round 1px)");
testStyleValue("inset(1px -1px 1px 1px round 1px 1px 1px 1px)", "inset(1px -1px 1px 1px round 1px)");
testStyleValue("inset(1px 1px -1px 1px round 1px 1px 1px 1px)", "inset(1px 1px -1px round 1px)");
testStyleValue("inset(1px 1px 1px -1px round 1px 1px 1px 1px)", "inset(1px 1px 1px -1px round 1px)");

// font-relative lengths - number serialization, units, resolution
testStyleValue("circle(1em at -1em +1em)", "circle(1em at -1em 1em)");
testStyleValue("circle(1.5em at -1.5em +1.5em)", "circle(1.5em at -1.5em 1.5em)");
testStyleValue("circle(.5em at -.5em +.5em)", "circle(0.5em at -0.5em 0.5em)");

testStyleValue("circle(1ex at 1ex 1ex)", "circle(1ex at 1ex 1ex)");
// FIXME: Add ch test when it is supported
testStyleValue("circle(1rem at 1rem 1rem)", "circle(1rem at 1rem 1rem)");

testComputedStyleValue("circle(1.5em at .5em 1em)", "circle(12px at 4px 8px)");
testComputedStyleValue("circle(1.5rem at .5rem 1rem)", "circle(24px at 8px 16px)");

// viewport-percentage lengths - units, resolution
testStyleValue("circle(1vw at 1vw 1vw)", "circle(1vw at 1vw 1vw)");
testStyleValue("circle(1vh at 1vh 1vh)", "circle(1vh at 1vh 1vh)");
testStyleValue("circle(1vmin at 1vmin 1vmin)", "circle(1vmin at 1vmin 1vmin)");

testComputedStyleValue("circle(1.5vw at .5vw 1vw)", "circle(12px at 4px 8px)");
testComputedStyleValue("circle(1.5vh at .5vh 1vh)", "circle(9px at 3px 6px)");
testComputedStyleValue("circle(1.5vmin at .5vmin 1vmin)", "circle(9px at 3px 6px)");

// percentage lengths - units
testStyleValue("circle(100% at 100% 100%)", "circle(100% at 100% 100%)");
testStyleValue("inset(45% 45% 90% 60% round 25% 10%)", "inset(45% 45% 90% 60% round 25% 10%)");
testStyleValue("ellipse(100% 100% at 100% 100%)", "ellipse(100% 100% at 100% 100%)");
testStyleValue("polygon(10% 20%, 30% 40%, 40% 50%)", "polygon(10% 20%, 30% 40%, 40% 50%)");

testComputedStyleValue("circle(150% at 50% 100%)", "circle(150% at 50% 100%)");
testComputedStyleValue("inset(45% 45% 90% 60% round 25% 10%)", "inset(45% 45% 90% 60% round 25% 10%)");
testComputedStyleValue("ellipse(100% 100% at 100% 100%)", "ellipse(100% 100% at 100% 100%)");
testComputedStyleValue("polygon(10% 20%, 30% 40%, 40% 50%)", "polygon(10% 20%, 30% 40%, 40% 50%)");

// reject non-lengths
testInvalidValue("-webkit-shape-outside", "circle(1 at 1px 1px)");
testInvalidValue("-webkit-shape-outside", "circle(px at 1px 1px)");
testInvalidValue("-webkit-shape-outside", "circle(1p at 1px 1px)");
testInvalidValue("-webkit-shape-outside", "circle(calc( at 1px 1px))");

// reject negative radiuses
testInvalidValue("shape-outside", "circle(-1.5px at -1.5px +1.5px)");
testInvalidValue("shape-outside", "inset(1cm 1mm 1in 1px round 1pt -1pc)");
testInvalidValue("shape-outside", "ellipse(-1em 1em at 1em 1em)");
testInvalidValue("shape-outside", "ellipse(1em -1em at 1em 1em)");


    checkTestFailures();
}


