import 'package:travel_pesawat/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  // In the provided code, CollectionReference _destinationReference is a private class variable, it's only accessible within the DestinationService class, and it's used to store the reference to the 'destinations' collection in the Firebase Firestore database.
  CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  // Future is used to represent a potential value, or error, that will be available at some time in the future
  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      // an object that represents the results of a query against the Firestore database
      QuerySnapshot result = await _destinationReference.get();

      // QuerySnapshot accessed the individual documents using the docs property, and then extract the data from those documents
      List<DestinationModel> destinations = result.docs.map(
        (e) {
          // Change the value of DestinationModel instance property fromJson
          return DestinationModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}

/* example value of variable
result:
 destinations
  |- destination1
    |- id: "1"
    |- name: "New York City"
    |- city: "New York"
    |- imageUrl: "https://example.com/newyork.jpg"
    |- rating: 4.5
    |- price: 200
  |- destination2
    |- id: "2"
    |- name: "Paris"
    |- city: "Paris"
    |- imageUrl: "https://example.com/paris.jpg"
    |- rating: 4.0
    |- price: 150

destinations = [
  DestinationModel(id: "1", name: "New York City", city: "New York", imageUrl: "https://example.com/newyork.jpg", rating: 4.5, price: 200),
  DestinationModel(id: "2", name: "Paris", city: "Paris", imageUrl: "https://example.com/paris.jpg", rating: 4.0, price: 150)
]
*/