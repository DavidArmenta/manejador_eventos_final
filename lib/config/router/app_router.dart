import 'package:go_router/go_router.dart';
import 'package:manejador_eventos/models/event_model.dart';
import 'package:manejador_eventos/presentation/screens/screens.dart';

final appRouter = GoRouter(routes:
  
  [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/login-page',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/creation-event',
    builder: (context, state) => const CreationEventPage(),
  ),GoRoute(
    path: '/view-event',
    builder: (context, state) => const ViewPageScreen(),
  ),
  GoRoute(
    path: '/menu-page',
    builder: (context, state) => const MenuPage(),
  ),
  GoRoute(
    path: '/new-user',
    builder: (context, state) => const RegistrationPage(),
  ),
  GoRoute(
      path: '/edit-event',
      builder: (context, state) {
      final event = state.extra as Event;
      return EditEventScreen(event: event);
  },
    ),
]);