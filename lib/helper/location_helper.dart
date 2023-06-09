import 'dart:convert';

import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyDAfVvaIWrsoxnPs9wDmsjh4Lx4PSUF0gw';


class LocationHelper {
  static String generateLocationPreviewImage({double latitude = 0, double longitude = 0}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C40.718217,-73.998284`&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlacesAddress(double lat, double long) async {
    final url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$GOOGLE_API_KEY');
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}