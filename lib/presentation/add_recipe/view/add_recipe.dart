import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/presentation/add_recipe/controller/add_recipe_controller.dart';

import '../../../global_widget/image_icon_button/image_icon_button.dart';

class AddRecipe extends StatefulWidget {
  AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController categoryController = TextEditingController();

  final TextEditingController ingredientController = TextEditingController();

  final TextEditingController instructionsController = TextEditingController();

  TextEditingController _hoursController = TextEditingController();
  TextEditingController _minutesController = TextEditingController();
  TextEditingController _secondsController = TextEditingController();

  File? image;

  // Duration duration = Duration(hours: 2, minutes: 30);

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  String getCookTime() {
    String hours = _hoursController.text;
    String minutes = _minutesController.text;
    String seconds = _secondsController.text;
    return '$hours:$minutes:$seconds';
  }

  // void _updateDuration() {
  //   Duration duration = Duration(
  //     hours: int.tryParse(_hoursController.text) ?? 0,
  //     minutes: int.tryParse(_minutesController.text) ?? 0,
  //     seconds: int.tryParse(_secondsController.text) ?? 0,
  //   );
  // }

  // @override
  // void dispose() {
  //   _hoursController.dispose();
  //   _minutesController.dispose();
  //   _secondsController.dispose();
  //   super.dispose();
  //
  // }

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          'Add recipe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Category Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  minLines: 1,
                  maxLines: 2,
                  controller: categoryController,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    hintText: 'Category of recipe',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: titleController,
                  minLines: 1,
                  // maxLines: 2,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    hintText: 'Give your recipe a name',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  minLines: 1,
                  maxLines: 2,
                  controller: descriptionController,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    hintText: 'Introduce your recipe, cooking tips',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Cook Time',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: _hoursController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration.collapsed(
                        // labelText: 'Hr',
                        border: InputBorder.none, hintText: '   Hr',
                      ),
                      maxLength: 2,
                      // onChanged: (_) => _updateDuration(),
                    ),
                  ),
                  SizedBox(width: 11),
                  Text(':', style: TextStyle(fontSize: 20)),
                  SizedBox(width: 11),

                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: _minutesController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration.collapsed(
                          hintText: '    Min', border: InputBorder.none),
                      maxLength: 2,
                      // onChanged: (_) => _updateDuration(),
                    ),
                  ),
                  SizedBox(width: 5),
                  // Text(':', style: TextStyle(fontSize: 20)),
                  // SizedBox(width: 5),
                  // Seconds input
                  // SizedBox(
                  //   width: 50,
                  //   child: TextFormField(
                  //     controller: _secondsController,
                  //     keyboardType: TextInputType.number,
                  //     decoration: InputDecoration(
                  //       labelText: 'sec',
                  //     ),
                  //     maxLength: 2,
                  //     // onChanged: (_) => _updateDuration(),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Add Image',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImageIconButton(
                      width: devWidth * 0.35,
                      height: devHeight * 0.06,
                      onPressed: () => _getImage(ImageSource.camera),
                      icon: Icons.camera_alt_outlined,
                      label: 'Camera'),
                  ImageIconButton(
                      width: devWidth * 0.35,
                      height: devHeight * 0.06,
                      onPressed: () => _getImage(ImageSource.gallery),
                      icon: Icons.photo,
                      label: 'Gallery'),
                ],
              ),
              image != null
                  ? Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: 200,
                      width: 200,
                      child: Image.file(
                        image!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Provider.of<AddRecipeController>(context, listen: false)
                      .onRecipeAdd(
                          categoryName: categoryController.text,
                          title: titleController.text,
                          desc: descriptionController.text,
                          image: image,
                          cookTime: getCookTime());

                  // cookTime:
                  //     '${duration.inHours}:${duration.inMinutes.remainder(60)}');

                  categoryController.clear();
                  titleController.clear();
                  descriptionController.clear();
                  // dispose();
                  _hoursController.clear();
                  _minutesController.clear();
                  _secondsController.clear();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.orange[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
              may not required parameters yo be added
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Ingredients',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  minLines: 1,
                  maxLines: 50,
                  controller: ingredientController,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    hintText: 'Recipes ingredients',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Instructions',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  minLines: 1,
                  maxLines: 50,
                  controller: instructionsController,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    hintText: 'Add instructions',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Preparation time',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'set time',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              */
