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

class StreetViewPanorama extends MVCObject {
  static StreetViewPanorama cast(js.Proxy proxy) => proxy == null ? null : new StreetViewPanorama.fromProxy(proxy);
  static bool isInstance(js.Proxy proxy) => js.instanceof(proxy, maps.StreetViewPanorama);

  Stream<NativeEvent> _onCloseclick;
  Stream _onLinksChanged;
  Stream _onPanoChanged;
  Stream _onPositionChanged;
  Stream _onPovChanged;
  Stream _onResize;
  Stream _onVisibleChanged;
  Stream _onZoomChanged;

  StreetViewPanorama(html.Node container, [StreetViewPanoramaOptions opts]) : super(maps.StreetViewPanorama, [container, opts]) { _initStreams(); }
  StreetViewPanorama.fromProxy(js.Proxy proxy) : super.fromProxy(proxy) { _initStreams(); }

  void _initStreams() {
    _onCloseclick = event.getStreamFor(this, "closeclick", NativeEvent.cast);
    _onLinksChanged = event.getStreamFor(this, "links_changed");
    _onPanoChanged = event.getStreamFor(this, "pano_changed");
    _onPositionChanged = event.getStreamFor(this, "position_changed");
    _onPovChanged = event.getStreamFor(this, "pov_changed");
    _onResize = event.getStreamFor(this, "resize");
    _onVisibleChanged = event.getStreamFor(this, "visible_changed");
    _onZoomChanged = event.getStreamFor(this, "zoom_changed");
  }

  Stream<NativeEvent> get onCloseclick => _onCloseclick;
  Stream get onLinksChanged => _onLinksChanged;
  Stream get onPanoChanged => _onPanoChanged;
  Stream get onPositionChanged => _onPositionChanged;
  Stream get onPovChanged => _onPovChanged;
  Stream get onResize => _onResize;
  Stream get onVisibleChanged => _onVisibleChanged;
  Stream get onZoomChanged => _onZoomChanged;

  List<StreetViewLink> get links => jsw.JsArrayToListAdapter.castListOfSerializables($unsafe.getLinks(), StreetViewLink.cast);
  String get pano => $unsafe.getPano();
  StreetViewPov get photographerPov => StreetViewPov.cast($unsafe.getPhotographerPov());
  LatLng get position => LatLng.cast($unsafe.getPosition());
  StreetViewPov get pov => StreetViewPov.cast($unsafe.getPov());
  bool get visible => $unsafe.getVisible();
  num get zoom => $unsafe.getZoom();
  void registerPanoProvider(StreetViewPanoramaData provider(String pano)) {
    $unsafe.registerPanoProvider(new js.Callback.many((String pano) => provider(pano)));
  }
  set pano(String pano) => $unsafe.setPano(pano);
  set position(LatLng latLng) => $unsafe.setPosition(latLng);
  set pov(StreetViewPov pov) => $unsafe.setPov(pov);
  set visible(bool flag) => $unsafe.setVisible(flag);
  set zoom(num zoom) => $unsafe.setZoom(zoom);

  Controls get controls => Controls.cast($unsafe.controls);
  set controls(Controls controls) => $unsafe.controls = controls;

  /// deprecated : use onXxx stream.
  @deprecated StreetViewPanoramaEvents get on => new StreetViewPanoramaEvents._(this);
}

@deprecated
class StreetViewPanoramaEvents {
  static final CLOSECLICK = "closeclick";
  static final LINKS_CHANGED = "links_changed";
  static final PANO_CHANGED = "pano_changed";
  static final POSITION_CHANGED = "position_changed";
  static final POV_CHANGED = "pov_changed";
  static final RESIZE = "resize";
  static final VISIBLE_CHANGED = "visible_changed";
  static final ZOOM_CHANGED = "zoom_changed";

  final StreetViewPanorama _streetViewPanorama;

  StreetViewPanoramaEvents._(this._streetViewPanorama);

  NativeEventListenerAdder get closeclick => new NativeEventListenerAdder(_streetViewPanorama, CLOSECLICK);
  NoArgsEventListenerAdder get linksChanged => new NoArgsEventListenerAdder(_streetViewPanorama, LINKS_CHANGED);
  NoArgsEventListenerAdder get panoChanged => new NoArgsEventListenerAdder(_streetViewPanorama, PANO_CHANGED);
  NoArgsEventListenerAdder get positionChanged => new NoArgsEventListenerAdder(_streetViewPanorama, POSITION_CHANGED);
  NoArgsEventListenerAdder get povChanged => new NoArgsEventListenerAdder(_streetViewPanorama, POV_CHANGED);
  NoArgsEventListenerAdder get resize => new NoArgsEventListenerAdder(_streetViewPanorama, RESIZE);
  NoArgsEventListenerAdder get visibleChanged => new NoArgsEventListenerAdder(_streetViewPanorama, VISIBLE_CHANGED);
  NoArgsEventListenerAdder get zoomChanged => new NoArgsEventListenerAdder(_streetViewPanorama, ZOOM_CHANGED);
}