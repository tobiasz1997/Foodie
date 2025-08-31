import 'package:foodie/common/models/author.dart';
import 'package:foodie/common/models/ingredients_mock.dart';
import 'package:foodie/common/models/recipe.dart';

final List<Recipe> recipeMock = [
  new Recipe(
    id: 0,
    name: 'Barszcz',
    rating: 5,
    totalRatingVoters: 12,
    servings: 4,
    category: MealCategory.lunch,
    preparationTime: 2.30,
    favourite: false,
    image:
        'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2025/03/Scrambled-Eggs-main.jpg',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ingredients: ingredientMock,
    stepsToExecute: stepsToExecuteMock,
    tips: tipsMock,
    author: Author(1, 'Janusz W'),
    originalUrl: 'https://aniagotuje.pl/przepis/sernik-krolewski',
  ),
  new Recipe(
    id: 1,
    name: 'Jajecznica',
    rating: 3.0,
    totalRatingVoters: 2,
    servings: 4,
    category: MealCategory.breakfast,
    preparationTime: 0.10,
    favourite: true,
    description: 'Łatwe i smaczne',
    ingredients: ingredientMock,
    stepsToExecute: stepsToExecuteMock,
    tips: tipsMock,
    author: Author(1, 'Janusz W'),
  ),
  new Recipe(
    id: 2,
    name: 'Sernik królewski',
    rating: 3.8,
    totalRatingVoters: 33,
    servings: 5,
    category: MealCategory.dessert,
    preparationTime: 4.50,
    favourite: false,
    image:
        'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2025/03/Scrambled-Eggs-main.jpg',
    ingredients: ingredientMock,
    stepsToExecute: stepsToExecuteMock,
    tips: tipsMock,
    author: Author(1, 'Janusz W'),
    originalUrl: 'https://aniagotuje.pl/przepis/sernik-krolewski',
  ),
  new Recipe(
    id: 3,
    name: 'Kopiec kreta',
    rating: 2.2,
    totalRatingVoters: 8,
    servings: 4,
    category: MealCategory.dessert,
    preparationTime: 2.05,
    favourite: false,
    image:
        'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2025/03/Scrambled-Eggs-main.jpg',
    ingredients: ingredientMock,
    stepsToExecute: stepsToExecuteMock,
    tips: tipsMock,
    author: Author(1, 'Janusz W'),
  ),
  new Recipe(
    id: 4,
    name: 'Sałatka szybka',
    rating: 0.7,
    totalRatingVoters: 44,
    servings: 1,
    description: 'Podkradnieta z policzonej szamy',
    category: MealCategory.salad,
    preparationTime: 0.15,
    favourite: true,
    image:
        'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2025/03/Scrambled-Eggs-main.jpg',
    ingredients: ingredientMock,
    stepsToExecute: stepsToExecuteMock,
    tips: tipsMock,
    author: Author(1, 'Janusz W'),
  ),
];

final stepsToExecuteMock = [
  'Włóż do dużego garnka: 1 kurczaka (lub kawałki mięsa z kurczaka)',
  'Dodaj warzywa: 2 marchewki, 1 pietruszkę, 1 cebulę, 1 por',
  'Wrzuć przyprawy: sól, pieprz, 3 ziarna ziela angielskiego, 2 liście laurowe',
  'Zalej wszystko 3-4 litrami zimnej wody',
  'Gotuj na małym ogniu przez 1,5 do 2 godzin',
  'W trakcie gotowania zbieraj szumowiny z powierzchni',
  'Po ugotowaniu przecedź rosół przez sitko, aby był klarowny',
  'Podawaj gorący z makaronem, kawałkami mięsa i warzyw',
];

final tipsMock = [
  'Używaj mięsa z kością – najlepiej kurczak z podrobami i wołowina (np. szponder)',
  'Cebulę opal nad ogniem lub przypiecz na suchej patelni – doda głębi smaku',
  'Wybieraj świeże warzywa: marchew, pietruszka, seler, por, kapusta włoska',
  'Dodaj świeży lubczyk – to tajemnica babcinego aromatu',
  'Zalewaj składniki zimną wodą – to pomaga wydobyć smak z mięsa',
  'Gotuj na bardzo małym ogniu przez minimum 1,5–2 godziny',
  'Regularnie zbieraj szumowiny – dzięki temu rosół będzie klarowny',
  "Nie przykrywaj garnka – rosół powinien 'oddychać'",
  'Używaj dobrej jakości wody – najlepiej filtrowanej lub źródlanej',
  'Po ugotowaniu przecedź rosół przez sitko, a warzywa dodaj świeże tuż przed podaniem',
];
