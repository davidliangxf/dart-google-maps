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

part of google_maps_weather;

abstract class _CloudLayer {
  @dartified GMap getMap();
  @dartified void setMap(GMap map);
}

class CloudLayer extends MVCObject implements _CloudLayer {
  static CloudLayer cast(js.Proxy proxy) => jsw.mapNotNull(proxy, (proxy) => new CloudLayer.fromProxy(proxy));

  CloudLayer() : super(maps.weather.CloudLayer);
  CloudLayer.fromProxy(js.Proxy proxy) : super.fromProxy(proxy);

  @override GMap getMap() => GMap.cast($unsafe.getMap());

  GMap get map => getMap();
  set map(GMap map) => setMap(map);
}