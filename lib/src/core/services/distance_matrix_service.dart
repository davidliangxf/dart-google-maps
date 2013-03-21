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

abstract class _DistanceMatrixService {
  void getDistanceMatrix(DistanceMatrixRequest request, void callback(DistanceMatrixResponse response, DistanceMatrixStatus status));
}

class DistanceMatrixService extends jsw.TypedProxy implements _DistanceMatrixService {
  static DistanceMatrixService cast(js.Proxy proxy) => jsw.mapNotNull(proxy, (proxy) => new DistanceMatrixService.fromProxy(proxy));

  DistanceMatrixService() : super(maps.DistanceMatrixService);
  DistanceMatrixService.fromProxy(js.Proxy proxy) : super.fromProxy(proxy);

  @override void getDistanceMatrix(DistanceMatrixRequest request, void callback(DistanceMatrixResponse response, DistanceMatrixStatus status)) {
    $unsafe.getDistanceMatrix(request, new js.Callback.once((js.Proxy response, js.Proxy status) => callback(DistanceMatrixResponse.cast(response), DistanceMatrixStatus.find(status))));
  }
}