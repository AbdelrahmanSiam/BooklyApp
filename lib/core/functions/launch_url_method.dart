import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlMethod(context, String uri) async {
  Uri url = Uri.parse(uri);
  if (await canLaunchUrl(url)) {
    launchUrl(url);
  } else {
    CustomSnackBar(context, uri);
  }
}

void CustomSnackBar(context, String uri) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("Can not open $uri"),),);
}
