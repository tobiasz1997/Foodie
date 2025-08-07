import 'package:foodie/common/models/ingredient.dart';
import 'package:foodie/common/models/product.dart';

final List<Ingredient> ingredientMock = [
  Ingredient(
    id: 1,
    product: productsMock.singleWhere((element) => element.name.pl == 'Banan'),
    measurement: KitchenMeasurement.kilogram,
    value: 2,
    active: false,
  ),
  Ingredient(
    id: 2,
    product: productsMock.singleWhere((element) => element.name.pl == 'Mleko'),
    measurement: KitchenMeasurement.liter,
    value: 3,
    active: false,
  ),
  Ingredient(
    id: 3,
    product: productsMock.singleWhere((element) => element.name.pl == 'Ryż'),
    measurement: KitchenMeasurement.gram,
    value: 150,
    active: false,
  ),
  Ingredient(
    id: 4,
    product: productsMock.singleWhere((element) => element.name.pl == 'Pieprz'),
    measurement: KitchenMeasurement.millilitre,
    value: 2.5,
    active: false,
  ),
];

final List<Product> productsMock = [
  Product(
    id: 1,
    name: Name(pl: 'Jabłko', en: 'Apple'),
    category: IngredientsCategory.fruits,
  ),
  Product(
    id: 2,
    name: Name(pl: 'Banan', en: 'Banana'),
    category: IngredientsCategory.fruits,
  ),
  Product(
    id: 3,
    name: Name(pl: 'Maliny', en: 'Raspberry'),
    category: IngredientsCategory.fruits,
  ),
  Product(
    id: 4,
    name: Name(pl: 'Kiwi', en: 'Kiwi Fruit'),
    category: IngredientsCategory.fruits,
  ),
  Product(
    id: 5,
    name: Name(pl: 'Poziomki', en: 'Wild Strawberry'),
    category: IngredientsCategory.fruits,
  ),
  Product(
    id: 6,
    name: Name(pl: 'Ogórek', en: 'Cucumber'),
    category: IngredientsCategory.vegetables,
  ),
  Product(
    id: 7,
    name: Name(pl: 'Papryka', en: 'Pepper'),
    category: IngredientsCategory.vegetables,
  ),
  Product(
    id: 8,
    name: Name(pl: 'Sałata', en: 'Lettuce'),
    category: IngredientsCategory.vegetables,
  ),
  Product(
    id: 9,
    name: Name(pl: 'Szczypiorek', en: 'Chives'),
    category: IngredientsCategory.vegetables,
  ),
  Product(
    id: 10,
    name: Name(pl: 'Marchewka', en: 'Carrot'),
    category: IngredientsCategory.vegetables,
  ),
  Product(
    id: 11,
    name: Name(pl: 'Orzechy włoskie', en: 'Walnut'),
    category: IngredientsCategory.nuts,
  ),
  Product(
    id: 12,
    name: Name(pl: 'Ryż', en: 'Rice'),
    category: IngredientsCategory.dryProducts,
  ),
  Product(
    id: 13,
    name: Name(pl: 'Makaron', en: 'Pasta'),
    category: IngredientsCategory.dryProducts,
  ),
  Product(
    id: 14,
    name: Name(pl: 'Mąka', en: 'Flour'),
    category: IngredientsCategory.dryProducts,
  ),
  Product(
    id: 15,
    name: Name(pl: 'Kasza', en: 'Kasha'),
    category: IngredientsCategory.dryProducts,
  ),
  Product(
    id: 16,
    name: Name(pl: 'Cukier', en: 'Sugar'),
    category: IngredientsCategory.dryProducts,
  ),
  Product(
    id: 17,
    name: Name(pl: 'Margaryna', en: 'Margarine'),
    category: IngredientsCategory.dairy,
  ),
  Product(
    id: 18,
    name: Name(pl: 'Jajko', en: 'Egg'),
    category: IngredientsCategory.dairy,
  ),
  Product(
    id: 19,
    name: Name(pl: 'Masło', en: 'Butter'),
    category: IngredientsCategory.dairy,
  ),
  Product(
    id: 20,
    name: Name(pl: 'Mleko', en: 'Milk'),
    category: IngredientsCategory.dairy,
  ),
  Product(
    id: 21,
    name: Name(pl: 'Ser', en: 'Cheese'),
    category: IngredientsCategory.dairy,
  ),
  Product(
    id: 22,
    name: Name(pl: 'Boczek', en: 'Bacon'),
    category: IngredientsCategory.meat,
  ),
  Product(
    id: 23,
    name: Name(pl: 'Kabanosy', en: 'Kabanos Sausage'),
    category: IngredientsCategory.meat,
  ),
  Product(
    id: 24,
    name: Name(pl: 'Kiełbasa', en: 'Sausage'),
    category: IngredientsCategory.meat,
  ),
  Product(
    id: 25,
    name: Name(pl: 'Mięso mielone wołowe', en: 'Minced Beef'),
    category: IngredientsCategory.meat,
  ),
  Product(
    id: 26,
    name: Name(pl: 'Wołowina', en: 'Beef'),
    category: IngredientsCategory.meat,
  ),
  Product(
    id: 27,
    name: Name(pl: 'Karp', en: 'Carp'),
    category: IngredientsCategory.fishAndSeafood,
  ),
  Product(
    id: 28,
    name: Name(pl: 'Łosoś', en: 'Salmon'),
    category: IngredientsCategory.fishAndSeafood,
  ),
  Product(
    id: 29,
    name: Name(pl: 'Tuńczyk', en: 'Tuna'),
    category: IngredientsCategory.fishAndSeafood,
  ),
  Product(
    id: 30,
    name: Name(pl: 'Sól', en: 'Salt'),
    category: IngredientsCategory.herbsAndSpices,
  ),
  Product(
    id: 31,
    name: Name(pl: 'Pieprz', en: 'Pepper'),
    category: IngredientsCategory.herbsAndSpices,
  ),
  Product(
    id: 32,
    name: Name(pl: 'Podgrzybek', en: 'Bolete Mushroom'),
    category: IngredientsCategory.mushrooms,
  ),
  Product(
    id: 33,
    name: Name(pl: 'Borowik', en: 'Bolete'),
    category: IngredientsCategory.mushrooms,
  ),
  Product(
    id: 34,
    name: Name(pl: 'Czekolada', en: 'Chocolate'),
    category: IngredientsCategory.other,
  ),
  Product(
    id: 35,
    name: Name(pl: 'Herbata', en: 'Tea'),
    category: IngredientsCategory.other,
  ),
  Product(
    id: 36,
    name: Name(pl: 'Miód', en: 'Honey'),
    category: IngredientsCategory.other,
  ),
  Product(
    id: 37,
    name: Name(pl: 'Ocet', en: 'Vinegar'),
    category: IngredientsCategory.other,
  ),
  Product(
    id: 38,
    name: Name(pl: 'Kawa', en: 'Coffee'),
    category: IngredientsCategory.other,
  ),
  Product(
    id: 39,
    name: Name(pl: 'Biszkopt', en: 'Sponge'),
    category: IngredientsCategory.semiFinishedProducts,
  ),
  Product(
    id: 40,
    name: Name(pl: 'Bulion', en: 'Stock'),
    category: IngredientsCategory.semiFinishedProducts,
  ),
  Product(
    id: 41,
    name: Name(pl: 'Kechup', en: 'Ketchup'),
    category: IngredientsCategory.semiFinishedProducts,
  ),
  Product(
    id: 42,
    name: Name(pl: 'Nutella', en: 'Nutella'),
    category: IngredientsCategory.semiFinishedProducts,
  ),
  Product(
    id: 43,
    name: Name(pl: 'Musztarda', en: 'Mustard'),
    category: IngredientsCategory.semiFinishedProducts,
  ),
  Product(
    id: 44,
    name: Name(pl: 'Piwo', en: 'Beer'),
    category: IngredientsCategory.alcohol,
  ),
  Product(
    id: 45,
    name: Name(pl: 'Wino', en: 'Wine'),
    category: IngredientsCategory.alcohol,
  ),
  Product(
    id: 46,
    name: Name(pl: 'Bułka', en: 'Roll'),
    category: IngredientsCategory.bread,
  ),
  Product(
    id: 47,
    name: Name(pl: 'Chleb', en: 'Bread'),
    category: IngredientsCategory.bread,
  ),
  Product(
    id: 48,
    name: Name(pl: 'Tortilla', en: 'Tortilla'),
    category: IngredientsCategory.bread,
  ),
  Product(
    id: 49,
    name: Name(pl: 'Białko', en: 'Protein'),
    category: IngredientsCategory.nutrients,
  ),
  Product(
    id: 50,
    name: Name(pl: 'Witamina C', en: 'Ascorbic Acid'),
    category: IngredientsCategory.nutrients,
  ),
];
