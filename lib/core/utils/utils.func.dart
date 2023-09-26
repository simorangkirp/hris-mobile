import 'dart:typed_data';

String convertUint8ListToString(Uint8List uint8list) {
  return String.fromCharCodes(uint8list);
}

Uint8List convertStringToUint8List(String str) {
  final List<int> codeUnits = str.codeUnits;
  final Uint8List unit8List = Uint8List.fromList(codeUnits);

  return unit8List;
}

// String imagepath = " /data/user/img.jpg"; 
// //image path, you can get it with image_picker package

// File imagefile = File(imagepath); //convert Path to File
// Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
// String base64string = base64.encode(imagebytes); //convert bytes to base64 string
// print(base64string); 

// /* Output:
//   /9j/4Q0nRXhpZgAATU0AKgAAAAgAFAIgAAQAAAABAAAAAAEAAAQAAAABAAAJ3
//   wIhAAQAAAABAAAAAAEBAAQAAAABAAAJ5gIiAAQAAAABAAAAAAIjAAQAAAABAAA
//   AAAIkAAQAAAABAAAAAAIlAAIAAAAgAAAA/gEoAA ... long string output
// */
//
//Uint8List decodedbytes = base64.decode(base64string);
//decode base64 stirng to bytes 
// Uint8List byte = Uint8List Uint8List.fromList(List<int> elements);