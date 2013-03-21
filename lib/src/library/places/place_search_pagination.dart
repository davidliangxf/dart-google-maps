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

part of google_maps_places;

abstract class _PlaceSearchPagination {
  void nextPage();
  bool hasNextPage;
}

class PlaceSearchPagination extends jsw.MagicProxy implements _PlaceSearchPagination {
  static PlaceSearchPagination cast(js.Proxy proxy) => jsw.mapNotNull(proxy, (proxy) => new PlaceSearchPagination.fromProxy(proxy));

  PlaceSearchPagination() : super();
  PlaceSearchPagination.fromProxy(js.Proxy proxy) : super.fromProxy(proxy);
}