import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File image;

  gallery() async {
    var _image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      image = _image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Selling Price"),
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: InputDecoration(labelText: "Product Description"),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
                onTap: gallery,
                child: image == null
                    ? Image.asset(
                        "././assets/img/placeholder.jpg",
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        image,
                        fit: BoxFit.cover,
                      )),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.pink,
                          Colors.purple,
                        ])),
                child: Text(
                  'Save Product',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
