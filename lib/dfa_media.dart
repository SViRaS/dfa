import 'package:dfa_media_example/src/features/home/bloc/history_bloc.dart';

import 'package:dfa_media_example/src/features/home/repository/request_repository.dart';
import 'package:dfa_media_example/src/router/rounter_config.dart';
import 'package:dfa_media_example/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DfaMediaApp extends StatelessWidget {
  final RequestRepository historyRepository;
  const DfaMediaApp({super.key, required this.historyRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemsBloc(historyRepository),
      child: MaterialApp.router(
        theme: appTheme(),
        routerConfig: AppRouter().router,
      ),
    );  
  }
}
