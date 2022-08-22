import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_project_2022/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_project_2022/constants/strings.dart';
import 'package:bloc_project_2022/data/repository/characters_repository.dart';
import 'package:bloc_project_2022/data/web_services/characters_web_services.dart';
import 'package:bloc_project_2022/presentation/screens/characters_details_screen.dart';
import 'package:bloc_project_2022/presentation/screens/characters_screen.dart';

import 'data/models/characters.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => charactersCubit,
                  child: const CharactersScreen(),
                ));
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      CharactersCubit(charactersRepository),
                  child: CharacterDetailsScreen(
                    character: character,
                  ),
                ));
    }
    return null;
  }
}
