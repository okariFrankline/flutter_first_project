// Class that models the data that will be used in the to display and image
class ImageModel {
  // id
  int id;
  // url
  String url;
  // the title
  String title;

  // normal contructor
  ImageModel(this.id, this.url, this.title);

  // constructor from json
  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    // set the id
    id = parsedJson["id"];
    // set the url
    url = parsedJson["url"];
    // the title
    title = parsedJson["url"];
  }
}
