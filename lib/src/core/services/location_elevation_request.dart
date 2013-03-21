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

abstract class _LocationElevationRequest {
  List<LatLng> locations;
}

class LocationElevationRequest extends jsw.TypedProxy implements _LocationElevationRequest {
  static LocationElevationRequest cast(js.Proxy proxy) => jsw.mapNotNull(proxy, (proxy) => new LocationElevationRequest.fromProxy(proxy));

  LocationElevationRequest() : super();
  LocationElevationRequest.fromProxy(js.Proxy proxy) : super.fromProxy(proxy);

  @override List<LatLng> get locations => jsw.JsArrayToListAdapter.castListOfSerializables($unsafe.locations, LatLng.cast);
  @override set locations(List<LatLng> locations) => $unsafe.locations = jsifyList(locations);
}