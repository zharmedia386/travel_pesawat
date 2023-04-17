import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String hobby;
  final int balance;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.hobby = '',
    this.balance = 0,
  });

  // This allows you to easily access the properties of a UserModel object by calling the props getter. For example, you can use the props getter to iterate over the properties of a UserModel object
  // UserModel user = UserModel(id: "1", email: "example@gmail.com", name: "John Smith", hobby: "reading", balance: 1000);
  // for (var prop in user.props) print(prop);
  @override
  List<Object?> get props => [id, email, name, hobby, balance];
}
