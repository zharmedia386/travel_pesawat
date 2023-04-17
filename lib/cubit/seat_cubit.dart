import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  // an initial value of an empty list []. This initial value represents the initial state of the SeatCubit class and it's stored in the state property inherited from the Cubit class.
  SeatCubit() : super([]);

  bool isSelected(String id) {
    // indexOf: find the id on the state and returns the index of the first occurrence of that id in the list and return -1 if the id is not found in the state of array
    int index = state.indexOf(id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }

  // This method is used to select a seat by its id. It checks if the seat is already selected, if not, it adds the seat id to the state list, otherwise it removes the seat id from the state list
  void selectSeat(String id) {
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    print(state);

    // update the states of array with the new selected seat
    emit(List.from(state));
  }
}

/* example value of state
  [ 'B3', 'A2', 'B1', 'A1']
*/
