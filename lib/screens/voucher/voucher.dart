import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi_resto/blocs/basket/basket_bloc.dart';
import 'package:yumi_resto/models/models.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  static const String routeName = '/Voucher';

  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => const VoucherScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 198, 184),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 82, 71),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Voucher',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            letterSpacing: 3,
          ),
        ),
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
                    color: const Color.fromARGB(255, 245, 198, 184),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 120,
                  child: MaterialButton(
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const Text(
            'Enter a voucher code',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    // controller: voucherController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Voucher Code',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 5,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    onChanged: (value) async {
                      //    print(await VoucherRepository().searchVoucher(value));
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Your Vouchers',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 5,
          ),
          BlocBuilder<BasketBloc, BasketState>(
            builder: (context, state) {
              if (state is BasketLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is BasketLoaded) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: Voucher.vouchers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1x',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                Voucher.vouchers[index].code,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            BlocBuilder<BasketBloc, BasketState>(
                                builder: (context, state) {
                              return TextButton(
                                style: TextButton.styleFrom(
                                  visualDensity: VisualDensity.compact,
                                ),
                                onPressed: () {
                                  context.read<BasketBloc>().add(
                                        AddVoucher(Voucher.vouchers[index]),
                                      );
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Apply',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Text('Something went wrong');
              }
            },
          ),
        ]),
      ),
    );
  }
}
