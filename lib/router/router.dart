import 'package:go_router/go_router.dart';
import 'package:pixabay_image/data/pixabay.dart';
import 'package:pixabay_image/ui/detail/detail_screen.dart';
import 'package:pixabay_image/ui/search/search_screen.dart';
import 'package:pixabay_image/ui/search/search_view_model.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (create) => SearchViewModel(),
        child: const SearchScreen(),
      ),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) => ChangeNotifierProvider(
        create: (create) => SearchViewModel(),
        child: DetailScreen(pixabay: state.extra as Pixabay),
      ),
    ),
  ],
);
