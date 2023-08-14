import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/basket/basket_bloc.dart';

class EditBasketScreen extends StatelessWidget {
  static const String routeName = '/edit-basket';

  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => EditBasketScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 198, 184),
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Color.fromARGB(255, 119, 82, 71),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 30,
            ),
          ),
          title: const Text(
            'Edit Basket',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              letterSpacing: 3,
              wordSpacing: 2,
            ),
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, 'edit-basket');
          //     },
          //     icon: Icon(
          //       Icons.edit,
          //       size: 30,
          //     ),
          //   ),
          // ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
          color: Colors.grey[500],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                color: Color.fromARGB(255, 245, 198, 184),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 120,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Done ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Items',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
                if (state is BasketLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is BasketLoaded) {
                  return state.basket.items.length == 0
                      ? Card(
                          color: Colors.grey[300],
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'No Items in the Basket',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: state.basket
                              .itemQuantity(state.basket.items)
                              .keys
                              .length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.grey[300],
                              child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(top: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(children: [
                                    Text(
                                      "Quantity : ${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                            color: Colors.black45,
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      visualDensity: VisualDensity.compact,
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(RemoveAllItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                    ),
                                    IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(AddItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(Icons.add_circle),
                                    ),
                                    IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(RemoveItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(Icons.remove_circle),
                                    ),
                                  ])),
                            );
                          });
                } else {
                  return Text('Something went wrong.');
                }
              }),
            ],
          ),
        ));
  }
}
