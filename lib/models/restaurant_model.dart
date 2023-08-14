import 'package:equatable/equatable.dart';
import 'menu_item_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItems> menuItems;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;

  const Restaurant({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.menuItems,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.priceCategory,
    required this.distance,
  });

  @override
  List<Object?> get props {
    return [
      id,
      imageUrl,
      name,
      tags,
      menuItems,
      deliveryTime,
      priceCategory,
      deliveryFee,
      distance,
    ];
  }

  static List<Restaurant> restaurants = [
    Restaurant(
        id: 1,
        name: "SAFARI",
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc658w3xEl6fPD4xvWwcshkHOJYilG0mZG1l3ppO6BEAkwDe7E7keUZpZZ3oDUIMQ47Fw&usqp=CAU',
        deliveryTime: 15,
        priceCategory: '\$',
        deliveryFee: 10,
        distance: 5,
        tags: MenuItems.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .toList()
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .toList()),
    Restaurant(
        id: 2,
        name: "B.Laban",
        imageUrl:
            "https://egypt-menu.com/wp-content/uploads/2022/03/%D8%A3%D8%B3%D8%B9%D8%A7%D8%B1-%D9%85%D9%86%D9%8A%D9%88-%D9%88%D9%81%D8%B1%D9%88%D8%B9-%D9%88%D8%B1%D9%82%D9%85-%D8%AA%D9%84%D9%8A%D9%81%D9%88%D9%86-%D8%A8-%D9%84%D8%A8%D9%86-B.Laban_-1536x681.jpg.webp",
        deliveryTime: 10,
        priceCategory: '\$',
        deliveryFee: 9,
        distance: 1,
        tags: MenuItems.menuItems
            .where((menuItem) => menuItem.restaurantId == 2)
            .toList()
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItem) => menuItem.restaurantId == 2)
            .toList()),
    Restaurant(
        id: 3,
        name: "El Karawan",
        imageUrl:
            "https://menoufia24.com/wp-content/uploads/2020/09/elkarawan.resturant.jpg",
        deliveryTime: 25,
        priceCategory: '\$',
        deliveryFee: 7,
        distance: 3,
        tags: MenuItems.menuItems
            .where((menuItem) => menuItem.restaurantId == 3)
            .toList()
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItem) => menuItem.restaurantId == 3)
            .toList()),
    Restaurant(
        id: 4,
        name: "Al Malek Farouk",
        imageUrl:
            "https://menoufia24.com/wp-content/uploads/2020/05/almalkfarouk.jpg",
        deliveryTime: 40,
        priceCategory: '\$',
        deliveryFee: 2,
        distance: 0.3,
        tags: MenuItems.menuItems
            .where((menuItem) => menuItem.restaurantId == 4)
            .toList()
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItem) => menuItem.restaurantId == 4)
            .toList()),
    Restaurant(
      id: 5,
      name: "El Demashky",
      imageUrl:
          "https://menoufia24.com/wp-content/uploads/2020/05/eldemshqy.jpg",
      deliveryTime: 35,
      priceCategory: '\$',
      deliveryFee: 5,
      distance: 0.2,
      tags: MenuItems.menuItems
          .where((menuItem) => menuItem.restaurantId == 5)
          .toList()
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItems.menuItems
          .where((menuItem) => menuItem.restaurantId == 5)
          .toList(),
    ),
    Restaurant(
      id: 6,
      name: "Dr Burger",
      imageUrl:
          "https://menoufia24.com/wp-content/uploads/2020/10/doctor-burger.jpg",
      deliveryTime: 50,
      priceCategory: '\$',
      deliveryFee: 5,
      distance: 0.2,
      tags: MenuItems.menuItems
          .where((menuItem) => menuItem.restaurantId == 6)
          .toList()
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItems.menuItems
          .where((menuItem) => menuItem.restaurantId == 6)
          .toList(),
    ),
  ];
}
