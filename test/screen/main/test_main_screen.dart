import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/screen/main/main_screen.dart';
import 'package:restaurant_app/provider/main/index_nav_provider.dart';
import 'package:restaurant_app/provider/home/list_restaurant_provider.dart';


class MockRestaurantListProvider extends Mock
    implements RestaurantListProvider {}

class MockIndexNavProvider extends Mock implements IndexNavProvider {}

void main() {
  late RestaurantListProvider restaurantListProvider;
  late IndexNavProvider indexNavProvider;
  late Widget widget;

  setUp(() {
    restaurantListProvider = MockRestaurantListProvider();
    indexNavProvider = MockIndexNavProvider();
    widget = MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<RestaurantListProvider>.value(
            value: restaurantListProvider,
          ),
          ChangeNotifierProvider<IndexNavProvider>.value(
              value: indexNavProvider),
        ],
        child: const MainScreen(),
      ),
    );
  });

  group('main screen widget test', () {
    testWidgets(
        'have every component, like AppBar and BottomNavigationBar when app first launch',
        (tester) async {
      when(() => restaurantListProvider.fetchRestaurantList())
          .thenAnswer((_) async => Future.value());
      when(() => indexNavProvider.indexBottomNavBar).thenReturn(0);

      final appBarFinder = find.byType(AppBar);
      final bottomNavigationBarFinder = find.byType(BottomNavigationBar);

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      
      expect(appBarFinder, findsOneWidget);
      expect(bottomNavigationBarFinder, findsOneWidget);

      final textInAppBarFinder = find.descendant(
        of: appBarFinder,
        matching: find.byType(Text),
      );
      final textInAppBar = tester.widget<Text>(textInAppBarFinder);
      expect(textInAppBar.data, "Restaurant App");

      final firstBottomNavBarIconFinder = find
          .descendant(
            of: bottomNavigationBarFinder,
            matching: find.byType(Icon),
          )
          .at(0);
      final firstBottomNavBarIcon = tester.widget<Icon>(
        firstBottomNavBarIconFinder,
      );
      expect(firstBottomNavBarIcon.icon, Icons.home);

      final secondBottomNavBarIconFinder = find
          .descendant(
            of: bottomNavigationBarFinder,
            matching: find.byType(Icon),
          )
          .at(1);
      final secondBottomNavBarIcon = tester.widget<Icon>(
        secondBottomNavBarIconFinder,
      );
      expect(secondBottomNavBarIcon.icon, Icons.search_sharp);

      final thirdBottomNavBarIconFinder = find
          .descendant(
            of: bottomNavigationBarFinder,
            matching: find.byType(Icon),
          )
          .at(2);
      final thirdBottomNavBarIcon = tester.widget<Icon>(
        thirdBottomNavBarIconFinder,
      );
      expect(thirdBottomNavBarIcon.icon, Icons.favorite);

      final firstBottomNavBarTextFinder = find.text('Home Recommendation');
      final secondBottomNavBarTextFinder = find.text('Search Restaurants');
      final thirdBottomNavBarTextFinder = find.text('Favorite Restaurants');

      expect(firstBottomNavBarTextFinder, findsOneWidget);
      expect(secondBottomNavBarTextFinder, findsOneWidget);
      expect(thirdBottomNavBarTextFinder, findsOneWidget);
    });
  });
}
