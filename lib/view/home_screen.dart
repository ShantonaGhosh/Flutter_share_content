import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_share_content/view/widget/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
 final img = 'https://media.istockphoto.com/id/1361510800/photo/use-a-document-management-system-an-online-documentation-database-to-correctly-manage-files.jpg?s=1024x1024&w=is&k=20&c=UcDb5ea9OPSugelZCK0PkdF_a01pbUndBs_a1mCxo1U=' ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: const Text('Share Data'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(10.0),
                 decoration: BoxDecoration(color: Colors.green.shade100),
                child: Column(
                  children: [
                    CustomTextField(controller: _textController,hintText: 'Text...',),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          if (_textController.value.text.isNotEmpty) {
                            Share.share(_textController.value.text);
                          }
                        },
                        child: const Text('Share this text')),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
                Container(
                    padding: const EdgeInsets.all(10.0),
                 decoration: BoxDecoration(color: Colors.green.shade100),
                child: Column(
                  children: [
                    CustomTextField(controller: _urlController, hintText: 'URL...',),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                        onTap: () {
                        const String webUrl = 'https://play.google.com/store/apps/details?id=com.starbight.muslim_life';
                          if (_urlController.value.text.isNotEmpty) {
                            Share.share('${_urlController.text} $webUrl');
                          }
                        },
                        child: const Text('Share this web link')),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                  padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(color: Colors.green.shade100),
                      child: Image.network(img),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: ()async{
                          final  uri = Uri.parse(img);
                      final res = await http.get(uri);
                      final bytes = res.bodyBytes;
                      final temp = await getTemporaryDirectory();
                      final  path = '${temp.path}/image.jpg';
                      File(path).writeAsBytesSync(bytes);
                      await Share.shareFiles([path], text: 'Image Shared');
                      
                      },
                    
                      child: const Text('Share this image',),
                      ),
                  ],
                ),
              ),

              MaterialButton(
                color: Colors.green.shade100,
                child: const Text('Share From Camera'),
                onPressed: () async {
                  //pick image from Camera
                  final imagepick = await ImagePicker().pickImage(source: ImageSource.camera);
                  if(imagepick == null){
                    return;
                  }
                  // ignore: deprecated_member_use
                  await Share.shareFiles([imagepick.path]);
                },
              ),
                const SizedBox(
                height: 15.0,
              ),
              MaterialButton(
                   color: Colors.green.shade100,
                child: const Text('Share From Galary'),
                onPressed: () async {
                  //pick image from Galery
                  final imagepick = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if(imagepick == null){
                    return;
                  }
                  await Share.shareFiles([imagepick.path]);
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              MaterialButton(
                   color: Colors.green.shade100,
                child: const Text('Pick document Files and share it'),
                onPressed: () async {

                  final result = await FilePicker.platform.pickFiles();

                  List<String>? files = result?.files
                      .map((file) => file.path)
                      .cast<String>()
                      .toList();

                  if (files == null) {
                    return;
                  }

                  // ignore: deprecated_member_use
                  await Share.shareFiles(files);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
