import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  List<bool> isLiked=[false,false,false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://tse2.explicit.bing.net/th?id=OIP.2BvoUsJNneeu_ALPbUmCHwHaLH&pid=Api&P=0&h=180",
            ),
          ),
        ),
        title: Text(
          "Welcome User",
          style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
        ),
        actions: [],
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(onPressed: (){
                              setState(() {
                                isLiked[index]=!isLiked[index];
                              });
                            }, icon: Icon(
                              isLiked[index]
                              ?Icons.favorite:Icons.favorite_outline,
                              color: isLiked[index]?Colors.red:Colors.black,
                              size: 30,
                              )),
                            IconButton(
                              onPressed: () {
                                _showCommentDialog(context);
                              },
                              icon: Icon(
                                Icons.comment,color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.bookmark_add_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {
                           
                          },
                        ),
                      ],
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
  
  void _showCommentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: TextField(
          decoration: InputDecoration(
            hintText: 'Enter your comment...',
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Submit'),
          ),
        ],
      );
    },
  );
}
}