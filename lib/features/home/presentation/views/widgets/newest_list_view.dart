import 'package:bookly/core/widgets/custom_failure_widget.dart';
import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/features/home/presentation/manager/newest_cubit/newest_cubit_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestCubitState>(
      builder: (context, state) {
        if (state is NewestCubitSuccessState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.newestBooks.length,
            itemBuilder: (contex, index) {
              return BookInfoListViewItem(
                bookModel: state.newestBooks[index],
              );
            },
          );
        } else if (state is NewestCubitFailureState) {
          return CustomFailureWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
