import 'dart:html';

import 'package:google_maps/google_maps.dart';

DirectionsRenderer directionsDisplay;
final DirectionsService directionsService = new DirectionsService();
GMap map;

void main() {
  directionsDisplay = new DirectionsRenderer();
  final chicago = new LatLng(41.850033, -87.6500523);
  final mapOptions = new MapOptions()
    ..zoom = 6
    ..mapTypeId = MapTypeId.ROADMAP
    ..center = chicago
    ;
  map = new GMap(querySelector("#map_canvas"), mapOptions);
  directionsDisplay.map = map;

  querySelector('#calcRoute').onClick.listen((e) => calcRoute());
}

void calcRoute() {
  final start = (querySelector('#start') as SelectElement).value;
  final end = (querySelector('#end') as SelectElement).value;
  final waypts = new List<DirectionsWaypoint>();
  final checkboxArray = querySelector('#waypoints') as SelectElement;
  for (final OptionElement option in checkboxArray.options) {
    if (option.selected) {
      waypts.add(new DirectionsWaypoint()
        ..location = option.value
        ..stopover = true
      );
    }
  }

  final request = new DirectionsRequest()
    ..origin = start
    ..destination = end
    ..waypoints = waypts
    ..optimizeWaypoints = true
    ..travelMode = TravelMode.DRIVING // TODO bad object in example DirectionsTravelMode
    ;
  directionsService.route(request, (DirectionsResult response, DirectionsStatus status) {
    if (status == DirectionsStatus.OK) {
      directionsDisplay.directions = response;
      final route = response.routes[0];
      final summaryPanel = querySelector('#directions_panel');
      final html = new StringBuffer();
      // For each route, display summary information.
      for (var i = 0; i < route.legs.length; i++) {
        final leg = route.legs[i];
        final routeSegment = i + 1;
        html.write('<b>Route Segment: ${routeSegment}</b><br>');
        html.write('${leg.startAddress} to ');
        html.write('${leg.endAddress}<br>');
        html.write('${leg.distance.text}<br><br>');
      }
      summaryPanel.innerHtml = html.toString();
    }
  });
}