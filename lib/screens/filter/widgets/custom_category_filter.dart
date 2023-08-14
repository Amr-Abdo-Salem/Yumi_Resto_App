import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi_resto/blocs/filter/filter_bloc.dart';

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
      if (state is FilterLoading) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is FilterLoaded) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.filter.categoryFilters.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 31),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.filter.categoryFilters[index].category.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                      height: 10,
                      child: Checkbox(
                        value: state.filter.categoryFilters[index].value,
                        onChanged: (bool? value) {
                          context.read<FilterBloc>().add(
                                UpdateCategoryFilter(
                                  categoryFilter: state
                                      .filter.categoryFilters[index]
                                      .copyWith(
                                          value: !state.filter
                                              .categoryFilters[index].value),
                                ),
                              );
                        },
                      ))
                ],
              ),
            );
          },
        );
      } else {
        return Text('Something went wrong.');
      }
    });
  }
}
