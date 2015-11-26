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
import "../../testharness.dart";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
<style>
body {
    margin: 0;
}
#outer {
    height: 300px;
    background-color: yellow;
    border: 5px solid blue;
    padding: 5px;
}
#middle {
    border: 5px solid black;
    padding: 5px;
    margin: 5px;
}
#middle2 {
    border: 10px solid salmon;
    padding: 10px;
    height: 100%;
    margin: 5px;
}
#middle3 {
    border: 10px solid purple;
    padding: 10px;
    margin: 5px;
}
#inner {
    -webkit-writing-mode: vertical-lr;
    border: 5px solid green;
    padding: 5px;
    margin: 5px;
}
.inline {
    display: inline-block;
    width: 20px;
    height: 100px;
    background-color: orange;
}
</style>
''';

const String htmlEL2 = r'''
<div class="container" id="outer" data-expected-height=320>
    <div id="middle" data-expected-height=290>
        <div id="middle2" data-expected-height=260>
            <div id="middle3" data-expected-height=210>
                <div id="inner" data-expected-height=160>
                    <div class="inline"></div>
                    <div class="inline"></div>
                    <div class="inline"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container" id="inner" data-expected-height=590>
    <div class="inline"></div>
    <div class="inline"></div>
    <div class="inline"></div>
    <div class="inline"></div>
    <div class="inline"></div>
    <div class="inline"></div>
    <div class="inline"></div>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    checkLayout('.container');
}
