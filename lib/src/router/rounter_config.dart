import 'package:dfa_media_example/src/features/home/presentation/view/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    )
  ]);
}
