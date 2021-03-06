import 'dart:convert';

import 'package:core_app/repo/pokemon.dart';
import 'package:core_app/util/pokemon_client.dart';


class PokemonRepo extends PokemonClient {
  @override
  String get endpoint => "pokemon";

  Future<List<Pokemon>> getAll() async {
    final response = await httpGet();
    final Map<String, dynamic> results = json.decode(response.body);

    if (response.statusCode == 200) {
      List<Pokemon> listPokemon = List();
      results["results"].forEach((element) => listPokemon.add(Pokemon.fromJson(element)));
      return listPokemon;
    } else {
      throw "ERROR";
    }
  }
}
