/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that intrinsic width values on absolutely positioned
 * element work.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "../../resources/check-layout.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>
      .container {
          position:relative;
          border: 5px solid blue;
          width: 350px;
          height: 350px;
      }
      .child {
          position:absolute;
          border: 5px solid pink;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <!-- The 310px expected values are the 300px intrinsic width of an iframe plus 10px of border.
          The 350px expected values are the iframe filling the 350px available width from the container.
      -->

      <!-- width tests -->
      <div class="container">
          <iframe class="child" style="width: -webkit-max-content;" data-expected-width="310"></iframe>
      </div>

      <div class="container">
          <iframe class="child" style="width: -webkit-min-content;" data-expected-width="310"></iframe>
      </div>

      <div class="container">
          <iframe class="child" style="width: -webkit-fit-content;" data-expected-width="310"></iframe>
      </div>

      <div class="container" style="width: 50px">
          <iframe class="child" style="width: -webkit-fit-content;" data-expected-width="310"></iframe>
      </div>

      <div class="container">
          <iframe class="child" style="width: -webkit-fill-available;" data-expected-width="350"></iframe>
      </div>

      <!-- min-width tests -->
      <div class="container">
          <iframe class="child" style="min-width: -webkit-max-content; width: 10px;" data-expected-width="310"></iframe>
      </div>

      <div class="container">
          <iframe class="child" style="min-width: -webkit-min-content; width: 10px;" data-expected-width="310"></iframe>
      </div>

      <div class="container">
          <iframe class="child" style="min-width: -webkit-fit-content; width: 10px;" data-expected-width="310"></iframe>
      </div>

      <div class="container" style="width: 50px">
          <iframe class="child" style="min-width: -webkit-fit-content; width: 10px;" data-expected-width="310"></iframe>
      </div>

      <div class="container">
          <iframe class="child" style="min-width: -webkit-fill-available; width: 10px;" data-expected-width="350"></iframe>
      </div>

      <!-- max-width tests -->
      <div class="container">
          <iframe class="child" style="max-width: -webkit-max-content; width: 1000px;" data-expected-width="310"></iframe>
      </div>

      <div class="container">
          <iframe class="child" style="max-width: -webkit-min-content; width: 1000px;" data-expected-width="310"></iframe>
      </div>

      <div class="container">
          <iframe class="child" style="max-width: -webkit-fit-content; width: 1000px;" data-expected-width="310"></iframe>
      </div>

      <div class="container" style="width: 50px">
          <iframe class="child" style="max-width: -webkit-fit-content; width: 1000px;" data-expected-width="310"></iframe>
      </div>

      <div class="container">
          <iframe class="child" style="max-width: -webkit-fill-available; width: 1000px;" data-expected-width="350"></iframe>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.container');
    asyncEnd();
  });
}
