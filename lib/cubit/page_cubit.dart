import 'package:bloc/bloc.dart';

class PageCubit extends Cubit<int> {
  // The state is initialized to 0 and stored in the state property inherited from the Cubit class.
  PageCubit() : super(0);

  void setPage(int newPage) {
    // updating state property with the newPage using the emit method
    emit(newPage);
  }
}
