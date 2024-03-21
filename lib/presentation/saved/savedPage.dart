import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
    final List<String> text = [
    "Birira Tacos",
    "Birira Tacos",
    "Birira Tacos",
  ];
  final List<String> name = ["Harry terl", "Mark Tony", "Lery Heal"];
  final List<String> img = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Bangladeshi_Biryani.jpg/220px-Bangladeshi_Biryani.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Biriyani.jpg/220px-Biriyani.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/1/18/Chicken_Biryani_in_Chennai.jpg"
  ];
  final List<String> simg = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Chicken_Biryani.jpg/220px-Chicken_Biryani.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/4/48/India_food.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Bangladeshi_Biryani.jpg/220px-Bangladeshi_Biryani.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        leading: Icon(Icons.bookmark_add_outlined),
        backgroundColor: Colors.orange,
        title: Text("Saved Recipe",
        style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: img.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(img[index]),
                    ),
                    title: Text(
                      name[index],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle: Text(text[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        simg[index],
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}