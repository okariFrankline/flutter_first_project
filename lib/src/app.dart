// create a statfeul widget that implements a counter
import "package:flutter/material.dart";
// import the http package in order to make requests to an endpoint
import 'package:http/http.dart' show get;
// import the convert libaray
import "dart:convert";
// import the image model
import 'models/image_model.dart';
// import the Image list
import "widgets/image_list.dart";

// define a stateful widget
class App extends StatefulWidget {
  // create state function that return the app state instance
  AppState createState() {
    return AppState();
  }
}

// define the app state function
class AppState extends State<App> {
  // a conute field
  int counter = 0;
  // list of images
  List<ImageModel> images = [];

  // function for getting image
  void fetchImage() async {
    // increment the counter since it starts at o
    counter++;
    // return a future to be used to get the data returned from the get request

    // url for getting the photo
    var response =
        await get("https://jsonplaceholder.typicode.com/photos/$counter");
    // decode the data
    var parsedJson = json.decode(response.body);
    // create a new image model from the data
    ImageModel newImage = ImageModel.fromJson(parsedJson);
    // update the state in order to add the new image to the list
    setState(() {
      images.add(newImage);
    });
  }

  // build function
  Widget build(BuildContext context) {
    // return a materia app
    return MaterialApp(
      // home page
      home: Scaffold(
        appBar: AppBar(
          title: Text("Let's get some images"),
        ),
        // body
        body: ImageList(images),
        // floating action button
        floatingActionButton: FloatingActionButton(
          // background color
          backgroundColor: Colors.teal,
          // icon
          child: Icon(Icons.add),
          // pressed
          // on pressed can take a reference to  function that will be invoked
          // immediately the button will be pressed.
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
