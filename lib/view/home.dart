import 'package:flutter/material.dart';
import 'package:try_two/controller/image_controller.dart';
import 'package:try_two/theming/themes.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";

  final ImageController _imageController = Get.put(ImageController());
  final TextEditingController _imageTextController = TextEditingController();

  @override
  Widget build(BuildContext context)  {

    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Do stuff with AI'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key:formKey,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.04),
                const Text("AI Picture generator", style: TextStyle(fontSize: 30)),
                SizedBox(height: height*0.04),

                TextField(
                  controller: _imageTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter text to generate an image",
                  ),
                  onSubmitted: (String value) async {
                    if(value.isEmpty) {
                      await showDialog<void>(context: context, builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Enter text!'),
                          content: const Text("Come on, get creative."),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Got it'),
                            ),
                          ],
                        );
                      },
                    );
                    }else {
                      await _imageController.getImage(imageText: _imageTextController.text.trim(),);
                      //////////////////////////////////////////////////////////////ToDo here
                    }
                  },

                ),
                SizedBox(height: height*0.04),
                Obx(() {
                  if (_imageController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                  } else {
                      //return ListView.builder(
                      //  itemCount: _imageController.image.value.length,
                      //  padding: const EdgeInsets.all(8),
                      //  itemBuilder: (BuildContext context, int position) {
                      //   return getItem(_imageController, position);
                      return Container(width: double.infinity, height: 300,
                      decoration: BoxDecoration(
                      image: DecorationImage(
                      image: _imageController.image.value.isNotEmpty
                      ? NetworkImage(_imageController.data.value)
                          : const NetworkImage(
                      'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80')),
                      ),
                      );
                    }}),

              ],
            )
          ),
        ),
      )
    );
  }
}

Container getItem(ImageController imageController, int position) {
  return Container(width: double.infinity, height: 300,
    decoration: BoxDecoration(
    image: DecorationImage(
      image: NetworkImage(imageController.image.value.elementAt(position)))));
}