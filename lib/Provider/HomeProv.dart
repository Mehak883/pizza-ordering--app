import 'package:flutter/material.dart';
import 'package:pixzzaapp/model.dart';

class HomeProv{
  List<PizzaDetails> _pd = <PizzaDetails>[
    PizzaDetails(
        'images/pizza-png-15.png',
        'Canadian Pizza',
        'The "Canadian pizza" toppings typically include tomato sauce, mozzarella cheese, side bacon, pepperoni, and mushrooms',
        Color.fromARGB(255, 250, 255, 190),
        35,
        1),
    PizzaDetails(
        'images/pizza-png-15.png',
        'Mushrooms-olives',
        'This delicious mushroom pizza is smothered in sautéed mushrooms, onions and garlic, and layers of mozzarella and fresh-grated parmesan',
        Color.fromRGBO(206, 255, 206, 1),
        60,
        2),
    PizzaDetails(
        'images/pizza-png-15.png',
        'Mushrooms-olives',
        'This delicious mushroom pizza is smothered in sautéed mushrooms, onions and garlic, and layers of mozzarella and fresh-grated parmesan',
        Color.fromRGBO(206, 255, 206, 1),
        20,
        3),
    PizzaDetails(
        'images/pizza-png-15.png',
        'Onion Chesse Pizza',
        'The wholesome pizza base is topped up with crunchy vegetables along with mozzarella cheese and is baked to perfection to tantalize your taste buds.',
        Color.fromARGB(255, 167, 211, 234),
        23,
        4),
    PizzaDetails(
        'images/pizza-png-15.png',
        'Tandoori Paneer Pizza',
        'Savor the perfect fusion of smoky tandoori flavors and succulent paneer on our exquisite Tandoori Paneer Pizza, where traditional Indian spices meet the cheesy delight of a classic pizza crust',
        Color.fromARGB(255, 249, 218, 254),
        57,
        5),
    PizzaDetails(
        'images/pizza-png-15.png',
        'FarmHouse Pizza',
        'Indulge in the rustic charm of our Farmhouse Pizza, featuring a medley of fresh, farm-to-table ingredients atop a golden crust, delivering a savory symphony of flavors straight from the heart of the countryside',
        Color.fromARGB(255, 186, 255, 199),
        76,
        6),
    // PizzaDetails('images/sweetcorn.png', 'Sweet Corn Pizza', ''),
    PizzaDetails(
        'images/pizza-png-15.png',
        'Veg BabyCorn Pizza',
        'Experience a burst of freshness with our Veg Baby Corn Pizza, where crisp baby corn, vibrant vegetables, and gooey cheese unite on a perfectly baked crust, creating a delightful symphony of flavors',
        Color.fromRGBO(255, 249, 196, 1),
        20,
        7),
    PizzaDetails(
        'images/pizza-png-15.png',
        'Veg BabyCorn Pizza',
        'Experience a burst of freshness with our Veg Baby Corn Pizza, where crisp baby corn, vibrant vegetables, and gooey cheese unite on a perfectly baked crust, creating a delightful symphony of flavors',
        Color.fromARGB(255, 167, 211, 234),
        63,
        8),
    PizzaDetails(
        'images/pizza-png-15.png',
        'Veg BabyCorn Pizza',
        'Experience a burst of freshness with our Veg Baby Corn Pizza, where crisp baby corn, vibrant vegetables, and gooey cheese unite on a perfectly baked crust, creating a delightful symphony of flavors',
        Color.fromRGBO(255, 196, 207, 1),
        45,
        9),
  ];
  List<PizzaDetails> get pd => _pd;

}
