import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/filter/filter_bloc.dart';

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
      if (state is FilterLoading) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is FilterLoaded) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: state.filter.priceFilters
              .asMap()
              .entries
              .map((price) => InkWell(
                    onTap: () {
                      print(state.filter.categoryFilters);

                      print(state.filter.priceFilters);
                      context.read<FilterBloc>().add(
                            UpdatePriceFilter(
                              priceFilter: state.filter.priceFilters[price.key]
                                  .copyWith(
                                      value: !state.filter
                                          .priceFilters[price.key].value),
                            ),
                          );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: state.filter.priceFilters[price.key].value
                            ? Colors.blueGrey
                            : Theme.of(context).primaryColor.withAlpha(100),
                      ),
                      child: Text(
                        state.filter.priceFilters[price.key].price.price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ))
              .toList(),
        );
      } else {
        return Text('Something went wrong.');
      }
    });
  }
}
