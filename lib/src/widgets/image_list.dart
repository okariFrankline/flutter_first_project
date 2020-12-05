// import flutter
import "package:flutter/material.dart";
// import the imageIcons
import "../models/image_model.dart";

// creating a list of stateless widgets
class ImageList extends StatelessWidget {
  // any fields that are decleared in a stateless widget need to be final
  final List<ImageModel> images;

  // constructor for the image
  ImageList(this.images);

  // implement the build method
  Widget build(BuildContext context) {
    // return a list view
    // a list view widget is used to display lists and implements a scroller
    // the builder constructor of the list view allows for the items of the
    // list to be created on demand(lazily) while the default creates the list eagerly
    return ListView.builder(
      // item count: => holds the number of itme to be displated
      itemCount: images.length,
      // item builder => this is the function that will be used to create each of the children
      // in the list: it is required and returns a widget
      itemBuilder: (context, int index) {
        // return a container that can be used to provide spacing and position of all the images
        return buildImage(images[index]);
      },
    );
  }

  // functioni for building an image
  Widget buildImage(ImageModel image) {
    // return a container
    return Container(
      // set the margin
      margin: EdgeInsets.all(20.0),
      // set the padding
      padding: EdgeInsets.all(20.0),
      // set the border of the container
      decoration: BoxDecoration(
        // set the border
        border: Border.all(
          // set the color of the border
          color: Colors.grey,
        ),
      ),
      // display the image
      // in order to display many widgets in the container class,
      // a layout widget has to be used. (Muliple child layout => which can be Column, Row etc)
      child: Column(
        // recives children of widgets
        children: <Widget>[
          // in order to allow for padding, use a padding widget that takes one child
          Padding(
            // child
            child: Image.network(image.url),
            // set the padding which is required
            padding: EdgeInsets.only(
              // set only the bottom padding
              bottom: 10.0,
            ),
          ),
          // display the title of the image
          Text(image.title),
        ],
      ),
    );
  }
}
