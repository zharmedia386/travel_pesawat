import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final double rating;
  final int price;

  DestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imageUrl = '',
    this.rating = 0.0,
    this.price = 0,
  });

  // Factory: special constructor used to create instances of a class in a more flexible way.
  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        city: json['city'],
        imageUrl: json['imageUrl'],
        rating: json['rating'].toDouble(),
        price: json['price'],
      );

  // is useful when you want to convert the data stored in the DestinationModel object to a format that can be easily converted to JSON and sent to a server or stored in a file.
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'imageUrl': imageUrl,
        'rating': rating,
        'price': price,
      };

  // List<Object?> get props => [id, email, name, hobby, balance]: In this case, the return type of props is a list of objects that may be nullable (Object?). This means that the individual elements in the list can be either an instance of the Object class or null.
  @override
  List<Object?> get props => [id, name, city, imageUrl, rating, price];
}
