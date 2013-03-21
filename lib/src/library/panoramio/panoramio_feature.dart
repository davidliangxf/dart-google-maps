// Copyright (c) 2012, Alexandre Ardhuin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

part of google_maps_panoramio;

abstract class _PanoramioFeature {
  String author;
  String photoId;
  String title;
  String url;
  String userId;
}

class PanoramioFeature extends jsw.MagicProxy implements _PanoramioFeature {
  static PanoramioFeature cast(js.Proxy proxy) => jsw.mapNotNull(proxy, (proxy) => new PanoramioFeature.fromProxy(proxy));

  PanoramioFeature() : super();
  PanoramioFeature.fromProxy(js.Proxy proxy) : super.fromProxy(proxy);
}