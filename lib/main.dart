import 'package:flutter/material.dart';
// Importing the Flutter material package for UI components.
import 'package:get/get.dart';
// Importing the GetX package for state management.
import 'package:getx_statemngt/countControl.dart';
// Importing the custom controller class for managing state.

import 'dashbord.dart';
// Importing another page (dashboard) for navigation.

void main() {
  runApp(const MyApp());
  // Entry point of the Flutter app, calling the MyApp widget.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Constructor for MyApp with a key for widget identification.

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const MyHomePage(),
      // Using GetMaterialApp for enhanced navigation and state management by GetX.
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // Constructor for MyHomePage with a key for widget identification.

  @override
  State<MyHomePage> createState() => _MyHomePageState();
// Creates the mutable state (_MyHomePageState) for this widget.
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final countController c = Get.put(countController());
    // Initializing and registering the countController using Get.put().

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Aligns the column's children vertically to the center.
          children: <Widget>[
            Obx(() => Text("${c.count}")),
            // Reactive widget that updates whenever 'count' changes.

            GetBuilder(builder: (countController controller) {
              return Text("${c.count}");
              // Another way to rebuild the UI using GetBuilder for non-reactive updates.
            }),

            ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                      "Sanckbar",
                      "just a message",
                      duration: Duration(seconds: 3)
                  );
                  // Displays a temporary snackbar message.
                },
                child: Text("SnackBar")
            ),

            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Alert",
                      // Title of the dialog.
                      content: Text("just an alert"),
                      // Body content of the dialog.
                      barrierDismissible: true,
                      // Allows dismissing the dialog by tapping outside it.
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // Closes the dialog.
                            },
                            child: Text("Ok")
                        )
                      ]
                  );
                },
                child: Text("Dialog")
            ),

            ElevatedButton(
                onPressed: () {
                  Get.to(dashboard());
                  // Navigates to the dashboard page using GetX.
                },
                child: Text("go to Nav")
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          c.increment();
          // Calls the increment method from countController to increase the count.
        },
        tooltip: 'Increment',
        // Tooltip message for the button.
        child: const Icon(Icons.add),
        // Icon for the floating action button.
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
