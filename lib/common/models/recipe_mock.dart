import 'package:foodie/common/models/recipe.dart';

final List<Recipe> recipeMock = [
  new Recipe(
    id: 0,
    name: 'Barszcz',
    rating: 5,
    category: MealCategory.lunch,
    preparationTime: 2.30,
    favourite: false,
    image:
        'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2025/03/Scrambled-Eggs-main.jpg',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  new Recipe(
    id: 1,
    name: 'Jajecznica',
    rating: 3.0,
    category: MealCategory.breakfast,
    preparationTime: 0.10,
    favourite: true,
    description: 'Łatwe i smaczne',
  ),
  new Recipe(
    id: 2,
    name: 'Sernik królewski',
    rating: 3.8,
    category: MealCategory.dessert,
    preparationTime: 4.50,
    favourite: false,
    image:
        'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2025/03/Scrambled-Eggs-main.jpg',
  ),
  new Recipe(
    id: 3,
    name: 'Kopiec kreta',
    rating: 2.2,
    category: MealCategory.dessert,
    preparationTime: 2.05,
    favourite: false,
    image:
        'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2025/03/Scrambled-Eggs-main.jpg',
  ),
  new Recipe(
    id: 4,
    name: 'Sałatka szybka',
    rating: 0.7,
    description: 'Podkradnieta z policzonej szamy',
    category: MealCategory.salad,
    preparationTime: 0.15,
    favourite: true,
    image:
        'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2025/03/Scrambled-Eggs-main.jpg',
  ),
];
