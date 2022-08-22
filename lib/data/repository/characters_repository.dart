import 'package:bloc_project_2022/data/models/characters.dart';
import 'package:bloc_project_2022/data/web_services/characters_web_services.dart';
import 'package:flutter/material.dart';

import '../models/quote.dart';

class CharactersRepository{
  late  CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters()async{
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }

  Future<List<Quote>> getAllQuotes(String charName)async{
    final quotes = await charactersWebServices.getCharacterQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }

}