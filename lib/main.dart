// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bloc_project_2022/app_router.dart';

void main() {
  runApp(BreakingBadApp(
    appRouter: AppRouter(),
  ));
}

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
