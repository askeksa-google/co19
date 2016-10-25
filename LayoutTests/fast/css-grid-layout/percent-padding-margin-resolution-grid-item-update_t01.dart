/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "../../resources/check-layout.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <style>
      .grid {
          grid-template-columns: 200px 200px;
          grid-template-rows: 100px 100px;
          height: 200px;
          width: 400px;
      }

      .percentPadding {
          width: 0px;
          height: 0px;
          padding: 50%;
      }

      .percentMargin {
          width: 0px;
          height: 0px;
          margin: 50%;
      }

      .percentPaddingAndMargin {
          width: 0px;
          height: 0px;
          padding: 10%;
          margin: 20%;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test that changing grid tracks size forces the grid items' to resolve percentage padding and margin</p>

      <div class="grid">
          <div class="firstRowFirstColumn percentPadding" data-expected-padding-top="50" data-expected-padding-right="50" data-expected-padding-bottom="50" data-expected-padding-left="50"></div>
          <div class="firstRowSecondColumn percentMargin" data-expected-margin-top="150" data-expected-margin-right="150" data-expected-margin-bottom="150" data-expected-margin-left="150"></div>
          <div class="secondRowFirstColumn percentPaddingAndMargin" data-expected-padding-top="10" data-expected-padding-right="10" data-expected-padding-bottom="10" data-expected-padding-left="10" data-expected-margin-top="20" data-expected-margin-right="20" data-expected-margin-bottom="20" data-expected-margin-left="20"></div>
          <div class="secondRowSecondColumn percentPaddingAndMargin" data-expected-padding-top="30" data-expected-padding-right="30" data-expected-padding-bottom="30" data-expected-padding-left="30" data-expected-margin-top="60" data-expected-margin-right="60" data-expected-margin-bottom="60" data-expected-margin-left="60"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  changeGridTrackSizesAndCheckLayout(_)
  {
    dynamic grid = document.getElementsByClassName("grid")[0];
    grid.offsetLeft;
    grid.style.gridTemplateColumns = "100px 300px";
    grid.style.gridTemplateRows = "50px 150px";
    checkLayout('.grid');
    asyncEnd();
  }

  asyncStart();
  window.addEventListener("load", changeGridTrackSizesAndCheckLayout, false);
}
