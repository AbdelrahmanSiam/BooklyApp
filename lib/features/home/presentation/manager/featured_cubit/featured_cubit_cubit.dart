import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repoes/home_repo_implementation.dart';
import 'package:equatable/equatable.dart';

part 'featured_cubit_state.dart';

class FeaturedCubitCubit extends Cubit<FeaturedCubitState> {
  FeaturedCubitCubit() : super(FeaturedCubitInitial());

  HomeRepoImplementation? homeRepoImplementation;

  void getFeaturedBooksMethod() {
  }
}
