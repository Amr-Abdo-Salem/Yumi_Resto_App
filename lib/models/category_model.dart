import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String image;


  Category({
    required this.id,
    required this.name,
    required this.image,
   
  });

  @override
  List<Object?> get props => [id, name, image];



  static List<Category> categories = [
    Category(
      id: 1,
      name: 'Drinks',
      image: 'assets/juice.png',

    ),
    Category(
      id: 2,
      name: 'Pizza',
    
     image: 'assets/pizza.png',
 
    ),
    Category(
      id: 3,
      name: 'Burgers',
     
      image: 'assets/burger.png',
    
    ),
    Category(
      id: 4,
      name: 'Desserts',
     
      image: 'assets/pancake.png',
    
    ),
    Category(
      id: 5,
      name: 'Salads',
     
      image: 'assets/avocado.png',

    ),
  ];
}