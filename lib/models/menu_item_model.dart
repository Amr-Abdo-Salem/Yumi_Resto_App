import 'package:equatable/equatable.dart';

class MenuItems extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;
  final String foodImage;

  const MenuItems({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.foodImage,
  });

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        description,
        price,
        foodImage,
      ];

  static List<MenuItems> menuItems = [
    MenuItems(
      id: 1,
      restaurantId: 1,
      name: 'Margherita',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      foodImage:
          'https://static01.nyt.com/images/2014/04/09/dining/09JPPIZZA2/09JPPIZZA2-master768-v2.jpg?w=1280&q=75',
    ),
    MenuItems(
      id: 2,
      restaurantId: 1,
      name: '4 Formaggi',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      foodImage:
          'https://www.insidetherustickitchen.com/wp-content/uploads/2020/07/Quattro-Formaggi-1200px-Inside-the-Rustic-Kitchen-2.jpg',
    ),
    MenuItems(
      id: 3,
      restaurantId: 1,
      name: 'Checken',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, Checken',
      price: 4.99,
      foodImage:
          'https://s23209.pcdn.co/wp-content/uploads/2021/10/BBQ-Chicken-PizzaIMG_0027-760x1140.jpg',
    ),
    MenuItems(
      id: 4,
      restaurantId: 1,
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      foodImage:
          'https://fastly.4sqi.net/img/general/600x600/ZDGM2IIMELOA2L4VEJMLMQYLLU4WSW4AJDBLTZ5FKAUQDHAT.jpg',
    ),
    MenuItems(
      id: 5,
      restaurantId: 1,
      name: 'Pepsi',
      category: 'Drinks',
      description: 'A drink',
      price: 1.99,
      foodImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBEGjvDdFwGrcSjUOCvWPx9BAh06iTEzEjhu-CGUBVFkxliRp9kOoX&usqp=CAE&s',
    ),
    MenuItems(
      id: 6,
      restaurantId: 1,
      name: 'Mango Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      foodImage:
          'https://www.acouplecooks.com/wp-content/uploads/2021/08/Mango-Daiquiri-010.jpg',
    ),
    MenuItems(
      id: 7,
      restaurantId: 2,
      name: 'Mango Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      foodImage:
          'https://www.acouplecooks.com/wp-content/uploads/2021/08/Mango-Daiquiri-010.jpg',
    ),
    MenuItems(
      id: 8,
      restaurantId: 2,
      name: 'Rice with milk',
      category: 'Desserts',
      description: 'Rice with milk by Lutas',
      price: 2.5,
      foodImage:
          'https://egypt-menu.com/wp-content/uploads/2022/03/%D8%A3%D8%B3%D8%B9%D8%A7%D8%B1-%D9%85%D9%86%D9%8A%D9%88-%D9%88%D9%81%D8%B1%D9%88%D8%B9-%D9%88%D8%B1%D9%82%D9%85-%D8%AA%D9%84%D9%8A%D9%81%D9%88%D9%86-%D8%A8-%D9%84%D8%A8%D9%86-B.Laban_-1536x681.jpg.webp',
    ),
    MenuItems(
      id: 9,
      restaurantId: 3,
      name: 'Mango Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      foodImage:
          'https://www.acouplecooks.com/wp-content/uploads/2021/08/Mango-Daiquiri-010.jpg',
    ),
    MenuItems(
      id: 10,
      restaurantId: 3,
      name: 'Koshary',
      category: 'Koshary',
      description: 'rice and basta',
      price: 9.99,
      foodImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4jj22p0msP1dnJRwshO2QgpM9jSlOB9xnV5to5rnNj7-5LIX4RkA6&usqp=CAE&s',
    ),
    MenuItems(
      id: 11,
      restaurantId: 3,
      name: 'Strawberry Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      foodImage:
          'https://www.alphafoodie.com/wp-content/uploads/2021/08/Strawberry-Juice-Main1.jpeg',
    ),
    MenuItems(
      id: 12,
      restaurantId: 3,
      name: 'Cappuccino',
      category: 'Drinks',
      description: 'A hot drink',
      price: 1.99,
      foodImage:
          'https://www.acouplecooks.com/wp-content/uploads/2020/10/how-to-make-cappuccino-005.jpg',
    ),
    MenuItems(
      id: 13,
      restaurantId: 4,
      name: 'Mango Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      foodImage:
          'https://www.acouplecooks.com/wp-content/uploads/2021/08/Mango-Daiquiri-010.jpg',
    ),
    MenuItems(
      id: 14,
      restaurantId: 4,
      name: 'Banana Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      foodImage:
          'https://www.indianveggiedelight.com/wp-content/uploads/2022/08/banana-juice.jpg',
    ),
    MenuItems(
      id: 15,
      restaurantId: 4,
      name: 'Strawberry Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      foodImage:
          'https://www.alphafoodie.com/wp-content/uploads/2021/08/Strawberry-Juice-Main1.jpeg',
    ),
    MenuItems(
      id: 16,
      restaurantId: 4,
      name: 'Barbecue',
      category: 'Oriental Food',
      description: 'A meats on greal',
      price: 9.99,
      foodImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Barbecue.jpg/300px-Barbecue.jpg',
    ),
    MenuItems(
      id: 17,
      restaurantId: 4,
      name: 'Mahashe',
      category: 'Oriental Food',
      description: 'A rice in vegetables',
      price: 9.99,
      foodImage:
          'https://1.bp.blogspot.com/-et0aXPlMBIM/YLqB0KGcI7I/AAAAAAAAAUg/di44p7F5Y1sKTD6S1qbDjxvcZw7jcTegQCLcBGAsYHQ/s16000/IMG_%25D9%25A2%25D9%25A0%25D9%25A2%25D9%25A1%25D9%25A0%25D9%25A6%25D9%25A0%25D9%25A4_%25D9%25A2%25D9%25A1%25D9%25A3%25D9%25A0%25D9%25A3%25D9%25A5.png',
    ),
    MenuItems(
      id: 18,
      restaurantId: 4,
      name: 'Melokhea',
      category: 'Oriental Food',
      description: 'A melokhea plant and tasha',
      price: 9.99,
      foodImage:
          'https://static.webteb.net/images/content/ramadanrecipe_recipe_5_719.jpg',
    ),
    MenuItems(
      id: 19,
      restaurantId: 5,
      name: 'Shawerma',
      category: 'Syrian Food',
      description: 'A checken or meat on skewer',
      price: 8.5,
      foodImage:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/8fdb5aba-478c-485f-833c-dd7e7ad6fccc.jpg',
    ),
    MenuItems(
      id: 20,
      restaurantId: 5,
      name: 'Checken Oriental',
      category: 'Syrian Food',
      description: 'Grilled chicken the Syrian way',
      price: 15,
      foodImage:
          'https://watanimg.elwatannews.com/image_archive/840x473/20336601241472302339.jpg',
    ),
    MenuItems(
      id: 21,
      restaurantId: 5,
      name: 'Marea Checken',
      category: 'Syrian Food',
      description: 'Shawerma in Marea Pasta',
      price: 7,
      foodImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGWcHkulRCmu1LDtJOapcKXy0pbtGrmW25GIdDV4k&s',
    ),
    MenuItems(
      id: 22,
      restaurantId: 5,
      name: 'Piza',
      category: 'Syrian Food',
      description: 'Piza checken or meat or shawrma',
      price: 20,
      foodImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2JrfAJc6zOYB8Rkr9JnOPE-ThkHMu0d5miqD0GXkyklksXjFcjP-RO6hyPVMiLfxSQMc&usqp=CAU',
    ),
    MenuItems(
      id: 23,
      restaurantId: 5,
      name: 'Barbecue',
      category: 'Syrian Food',
      description: 'A meat on greal',
      price: 20,
      foodImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Barbecue.jpg/300px-Barbecue.jpg',
    ),
    MenuItems(
      id: 24,
      restaurantId: 5,
      name: 'Kerap',
      category: 'Syrian Food',
      description: 'A meat or checken on kerap bread',
      price: 20,
      foodImage:
          'https://www.elbalad.news/UploadCache/libfiles/920/0/600x338o/696.jpg',
    ),
    MenuItems(
      id: 25,
      restaurantId: 5,
      name: 'Faheta',
      category: 'Syrian Food',
      description: 'Rice and Shawerma(meat or checken)',
      price: 20,
      foodImage:
          'https://www.thaqfny.com/wp-content/uploads/2020/11/%D8%B7%D8%B1%D9%8A%D9%82%D8%A9-%D9%81%D8%A7%D9%87%D9%8A%D8%AA%D8%A7-%D8%A7%D9%84%D8%AF%D8%AC%D8%A7%D8%AC.jpg',
    ),
    MenuItems(
      id: 26,
      restaurantId: 5,
      name: 'Mango Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 2.5,
      foodImage:
          'https://www.acouplecooks.com/wp-content/uploads/2021/08/Mango-Daiquiri-010.jpg',
    ),
    MenuItems(
      id: 27,
      restaurantId: 5,
      name: 'Banana Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 2.5,
      foodImage:
          'https://www.indianveggiedelight.com/wp-content/uploads/2022/08/banana-juice.jpg',
    ),
    MenuItems(
      id: 28,
      restaurantId: 5,
      name: 'Strawberry Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 2.5,
      foodImage:
          'https://www.alphafoodie.com/wp-content/uploads/2021/08/Strawberry-Juice-Main1.jpeg',
    ),
    MenuItems(
      id: 29,
      restaurantId: 5,
      name: 'Cappuccino',
      category: 'Drinks',
      description: 'A hot drink',
      price: 1.5,
      foodImage:
          'https://www.acouplecooks.com/wp-content/uploads/2020/10/how-to-make-cappuccino-005.jpg',
    ),
    MenuItems(
      id: 30,
      restaurantId: 5,
      name: 'Tea',
      category: 'Drinks',
      description: 'A hot drink',
      price: 0.5,
      foodImage: 'https://img.youm7.com/large/202302021129342934.jpg',
    ),
    MenuItems(
      id: 31,
      restaurantId: 3,
      name: 'Twagen',
      category: 'Koshary',
      description: 'Tagen(meat or checken)',
      price: 30,
      foodImage:
          'https://images.akhbarelyom.com/images/images/large/20200220110647189.jpg',
    ),
    MenuItems(
      id: 32,
      restaurantId: 2,
      name: 'Ice Cream',
      category: 'Dessetrs',
      description: 'Ice Cream',
      price: 9.99,
      foodImage:
          'https://lh5.googleusercontent.com/p/AF1QipPpnoHh0pyh6acQbS3FizPvhQnt1ZLqZmKijcYi=w114-h114-n-k-no',
    ),
    MenuItems(
      id: 33,
      restaurantId: 1,
      name: 'Saad',
      category: 'Salads',
      description: 'Tomatoes, Carrot, Onion',
      price: 3,
      foodImage:
          'https://www.foodandwine.com/thmb/efiMQeJ7tK4pVTxRJBZrfJecFiM=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/shaved-beet-and-carrot-salad-with-citrus-scallion-dressing-FT-RECIPE0422-00610b1862ae4aec920e662385fc6716.jpg',
    ),
    MenuItems(
      id: 34,
      restaurantId: 3,
      name: 'Saad',
      category: 'Salads',
      description: 'Tomatoes, Carrot, Onion',
      price: 3,
      foodImage:
          'https://www.foodandwine.com/thmb/efiMQeJ7tK4pVTxRJBZrfJecFiM=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/shaved-beet-and-carrot-salad-with-citrus-scallion-dressing-FT-RECIPE0422-00610b1862ae4aec920e662385fc6716.jpg',
    ),
    MenuItems(
      id: 35,
      restaurantId: 4,
      name: 'Margherita',
      category: 'Salads',
      description: 'Tomatoes, Carrot, Onion',
      price: 3,
      foodImage:
          'https://www.foodandwine.com/thmb/efiMQeJ7tK4pVTxRJBZrfJecFiM=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/shaved-beet-and-carrot-salad-with-citrus-scallion-dressing-FT-RECIPE0422-00610b1862ae4aec920e662385fc6716.jpg',
    ),
    MenuItems(
      id: 36,
      restaurantId: 5,
      name: 'Salad',
      category: 'Salads',
      description: 'Tomatoes, Carrot, Onion',
      price: 3,
      foodImage:
          'https://www.foodandwine.com/thmb/efiMQeJ7tK4pVTxRJBZrfJecFiM=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/shaved-beet-and-carrot-salad-with-citrus-scallion-dressing-FT-RECIPE0422-00610b1862ae4aec920e662385fc6716.jpg',
    ),
    MenuItems(
      id: 37,
      restaurantId: 6,
      name: 'OLd Scool',
      category: 'Burgers',
      description: 'Beef',
      price: 5,
      foodImage:
          'https://lh5.googleusercontent.com/p/AF1QipN_2hIaoSndA4lgNAgnn-xDxmZR5zaUjvzJG610=w114-h114-n-k-no',
    ),
    MenuItems(
      id: 38,
      restaurantId: 6,
      name: 'Hitchhiker',
      category: 'Burgers',
      description:
          'Pure beef burger patty, topped with our signature Buffalo sauce and cheddar cheese.',
      price: 6,
      foodImage:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/08c0084d-2a72-4f86-a169-8b9702cd9899.jpg',
    ),
    MenuItems(
      id: 39,
      restaurantId: 6,
      name: 'Bacon & Mushroom',
      category: 'Burgers',
      description:
          'Beef bacon with fresh sautéed mushroom, cheddar cheese, and creamy mayonnaise.',
      price: 6,
      foodImage:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/a2ee34f6-ec21-4038-a2f0-808561d4892a.jpg',
    ),
    MenuItems(
      id: 40,
      restaurantId: 6,
      name: 'Bacon & Finger',
      category: 'Burgers',
      description:
          'Sautéed mushroom, cheddar cheese, and creamy mayonnaise spread on top of our pure beef burger patty',
      price: 6,
      foodImage:
          'https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/33091983-3a63-476c-b4ad-087f6b91f72b.jpg',
    ),
    MenuItems(
      id: 41,
      restaurantId: 6,
      name: 'Chicken Classic',
      category: 'Burgers',
      description:
          'pure chicken burger patty, topped with our signature Buffalo sauce and cheddar cheese.',
      price: 4,
      foodImage:
          'https://feelgoodfoodie.net/wp-content/uploads/2020/06/Chicken-Burgers-6.jpg',
    ),
    MenuItems(
      id: 42,
      restaurantId: 6,
      name: 'Chicken Mushroom',
      category: 'Burgers',
      description:
          'Chicken bacon with fresh sautéed mushroom, cheddar cheese, and creamy mayonnaise',
      price: 4,
      foodImage:
          'https://lh5.googleusercontent.com/p/AF1QipNC3jy9QcjNaxufAz5Sanqs34AuQChBoeJ1noXR=w92-h92-n-k-no',
    ),
    MenuItems(
      id: 43,
      restaurantId: 6,
      name: 'Chicken Ring',
      category: 'Burgers',
      description:
          'Crispy cheese stuffed with chicken bacon, topped with crispy onion, BBQ sauce, grilled burger patty, and smoked cheese sauce with mushroom.',
      price: 4,
      foodImage:
          'https://lh5.googleusercontent.com/p/AF1QipOOUyn431sp38gboeXe4ye7ouaZ0hDFVXxLFYI1=w92-h92-n-k-no',
    ),
    MenuItems(
      id: 44,
      restaurantId: 6,
      name: 'Chilli Chicken',
      category: 'Burgers',
      description:
          'Pure beef burger patty, topped with our custom Grungy sauce, cheddar cheese, pickles, tomatoes, onion and lettuce.',
      price: 4,
      foodImage:
          'https://www.marionskitchen.com/wp-content/uploads/2023/03/Sticky-Chilli-Chicken-Burgers-03.jpg',
    ),
    MenuItems(
      id: 45,
      restaurantId: 6,
      name: 'Pepsi',
      category: 'Drinks',
      description: 'A drink',
      price: 1.99,
      foodImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBEGjvDdFwGrcSjUOCvWPx9BAh06iTEzEjhu-CGUBVFkxliRp9kOoX&usqp=CAE&s',
    ),
    MenuItems(
      id: 46,
      restaurantId: 6,
      name: 'Mango Juice',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      foodImage:
          'https://www.acouplecooks.com/wp-content/uploads/2021/08/Mango-Daiquiri-010.jpg',
    ),
  ];
}
