import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int fileCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("file upload"),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "上传图片",
          child: Icon(Icons.add_a_photo),
          onPressed: () {
            startFilePicker(); // 打开文件选择框
          }),
      body: Center(child: Text("${fileCount.toString()}个文件被选中"),),
    );
  }

  startFilePicker() {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.click();
    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      setState(() {
        fileCount = files.length;
      });
    });
  }
}
