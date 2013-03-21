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

part of google_maps;

abstract class _FusionTablesPolygonOptions {
  String fillColor;
  num fillOpacity;
  String strokeColor;
  num strokeOpacity;
  num strokeWeight;
}

class FusionTablesPolygonOptions extends jsw.MagicProxy implements _FusionTablesPolygonOptions {
  static FusionTablesPolygonOptions cast(js.Proxy proxy) => jsw.mapNotNull(proxy, (proxy) => new FusionTablesPolygonOptions.fromProxy(proxy));

  FusionTablesPolygonOptions() : super();
  FusionTablesPolygonOptions.fromProxy(js.Proxy proxy) : super.fromProxy(proxy);
}