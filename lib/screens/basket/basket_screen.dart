import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumi_resto/blocs/basket/basket_bloc.dart';

import '../edit_basket/edit_basket_screen.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  static const String routeName = '/basket';
  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => const BasketScreen(),
      settings: const RouteSettings(name: routeName),
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
            'Basket',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              letterSpacing: 3,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditBasketScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.edit,
                  size: 30,
                ))
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
          color: Colors.grey[500],
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  // color: const Color.fromARGB(255, 245, 198, 184),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 245, 198, 184),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Checkout');
                      },
                      child: Text("Go to checkout ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cutlury',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  elevation: 5,
                  color: Colors.grey[300],
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Do you want culurty ?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        BlocBuilder<BasketBloc, BasketState>(
                            builder: (context, state) {
                          if (state is BasketLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is BasketLoaded) {
                            return SizedBox(
                              width: 100,
                              child: SwitchListTile(
                                  dense: false,
                                  value: state.basket.cutlery,
                                  activeColor:
                                      Theme.of(context).colorScheme.primary,
                                  onChanged: (bool? newValue) {
                                    context.read<BasketBloc>().add(
                                          ToggleSwitch(),
                                        );
                                  }),
                            );
                          } else {
                            return Text('Something went wrong.');
                          }
                        })
                      ],
                    ),
                  ),
                ),
                Text(
                  'Items',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
                  if (state is BasketLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is BasketLoaded) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                elevation: 5,
                                child: Container(
                                    height: 40,
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
                                            .copyWith(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      Text(
                                        "\$${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(color: Colors.black),
                                      ),
                                    ])),
                              );
                            });
                  } else {
                    return Text('Something went wrong.');
                  }
                }),
                Card(
                  color: Colors.grey[300],
                  elevation: 5,
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/logo.svg',
                            height: 100,
                          ),
                          BlocBuilder<BasketBloc, BasketState>(
                              builder: (context, state) {
                            if (state is BasketLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is BasketLoaded) {
                              return (state.basket.deliveryTime == null)
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "delivery in 15 minutes",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 245, 198, 184),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/Delivery-Time');
                                            },
                                            child: Text(
                                              "change",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Text(
                                      'Delivery at ${state.basket.deliveryTime!.value}');
                            } else {
                              return Text('Something went wrong.');
                            }
                          })
                        ]),
                  ),
                ),
                Card(
                  color: Colors.grey[300],
                  elevation: 5,
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(children: [
                      BlocBuilder<BasketBloc, BasketState>(
                          builder: (context, state) {
                        if (state is BasketLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is BasketLoaded) {
                          return state.basket.voucher == null
                              ? Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Do you want have a voucher ?",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 245, 198, 184),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/Voucher');
                                          },
                                          child: Text(
                                            "Apply",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Text(
                                  "your voucher is added !",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                        } else {
                          return Text('Something went wrong.');
                        }
                      }),
                      Expanded(
                        child: SvgPicture.asset(
                          'assets/voucher.svg',
                          height: 125,
                        ),
                      ),
                    ]),
                  ),
                ),
                Card(
                  color: Colors.grey[300],
                  elevation: 5,
                  child: Container(
                    height: 65,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                      if (state is BasketLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is BasketLoaded) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SubTotal",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  "\$${state.basket.subtotal}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "delivery fee",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  "\$3",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "total",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  "\$${state.basket.totalString}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            )
                          ],
                        );
                      } else {
                        return Text('Something went wrong.');
                      }
                    }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
