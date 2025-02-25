import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';

class DetailContentWidget extends StatelessWidget {
  final RestaurantDetail restaurant;

  const DetailContentWidget({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          spacing: 4,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              spacing: 4,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          const Icon(Icons.location_pin, color: Colors.red, ),
                            Expanded(
                              child: Text(
                                '${restaurant.address}, ${restaurant.city}',
                                softWrap: true,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 6,
                        children: [
                          const Icon(Icons.star, color: Colors.amber, ),
                            Text(
                              '${restaurant.rating}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
            const SizedBox(height: 4),
              Wrap(
                direction: Axis.horizontal,
                spacing: 12,
                runSpacing: 8,
                children: restaurant.categories.isNotEmpty ?
                restaurant.categories.map(
                  (category) {
                    return Container(
                      decoration: BoxDecoration(
                        
                        color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withAlpha(64),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                        child: Text(
                          category.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                    );
                  },
                ).toList() :
                const [SizedBox()],
              ),
              const SizedBox(height: 30),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  restaurant.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 30),
                  Text(
                    'Menus',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Makanan',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 35,
                    child: ListView.builder(
                      itemCount: restaurant.menu.foods.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final food = restaurant.menu.foods[index];
                        return Card(
                          color: Theme.of(context).colorScheme.primary.withAlpha(80),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1),
                          ),
                          elevation: 4,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                                child: Text(
                                  food.name,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    'Minuman',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 35,
                    child: ListView.builder(
                      itemCount: restaurant.menu.drinks.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final drink = restaurant.menu.drinks[index];
                        return Card(
                          color: Theme.of(context).colorScheme.primary.withAlpha(80),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1),
                          ),
                          elevation: 4,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                                child: Text(
                                  drink.name,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
    );
  }
}