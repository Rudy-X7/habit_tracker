import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchCountries() async {
  final response =
      await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

  if (response.statusCode == 200) {
    List<dynamic> countriesJson = json.decode(response.body);
    List<String> countryList = countriesJson
        .map((country) => country['name']['common'] as String)
        .toList();
    return countryList;
  } else {
    throw Exception('Failed to load countries');
  }
}
async function fetchCountries() {
    const response = await fetch('https://restcountries.com/v3.1/all');
    if (response.ok) {
        const data = await response.json();
        return data.map(country => country.name.common);
    } else {
        throw new Error('Failed to fetch countries');
    }
}
