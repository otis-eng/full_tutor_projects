// Upload(File imageFile) async {
//   var stream =
//       new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//   var length = await imageFile.length();

//   var uri = Uri.parse(uploadURL);

//   var request = new http.MultipartRequest("POST", uri);
//   var multipartFile = new http.MultipartFile('file', stream, length,
//       filename: basename(imageFile.path));
//   //contentType: new MediaType('image', 'png'));

//   request.files.add(multipartFile);
//   var response = await request.send();
//   print(response.statusCode);
//   response.stream.transform(utf8.decoder).listen((value) {
//     print(value);
//   });
// }
