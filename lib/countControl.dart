import 'package:get/get.dart';
// Importing the GetX package for state management in Flutter.

class countController extends GetxController {
  // A controller class that extends GetxController, which provides state management features.

  var count = 0.obs;
  // Declaring a reactive variable 'count' initialized to 0.
  // The '.obs' makes the variable observable, meaning its changes can be tracked.

  void increment() {
    // A method to increment the 'count' variable.
    count++;
    // Increments the value of 'count' by 1.

    update();
    // Notifies all listeners to rebuild the UI where this controller is used.
  }
}
