import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_config/app_config.dart';
import '../../presentation/feed_page/feed_page_controller.dart';

class FeedWidget extends StatelessWidget {
  //const PostCard({super.key});

  final String? profPic;
  final String name;
  final String timePosted;
  final String descriptionPosted;
  final String imagePosted;

  final bool? showBlueTick;
  final String? likeCount;
  final String commentCount;
  final String shareCount;
  final int? itemId;

  FeedWidget(
      {this.profPic,
      required this.name,
      required this.timePosted,
      required this.descriptionPosted,
      required this.imagePosted,
      this.showBlueTick = false,
      this.likeCount,
      required this.commentCount,
      required this.shareCount,
      this.itemId
      });

  @override
  Widget build(BuildContext context) {
    var imageUrl = imagePosted == null
        ? "https://th.bing.com/th/id/OIP.y6HMdOJ4LiIUWk7n5ZGlpAHaHa?w=480&h=480&rs=1&pid=ImgDetMain"
        : AppConfig.mediaurl + imagePosted!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // postCardHeader(),
          ListTile(
            // leading: ProfilePics(displayImage: profPic, displayStatus: false),
            title: Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  showBlueTick == true ? Icons.verified : null,
                  color: Colors.blue,
                  size: 26,
                )
              ],
            ),
            subtitle: Text(timePosted == null ? "" : timePosted),
          ),
          // imageSection(),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Image.network(imageUrl),
          ),
          titleSection(),
          footerSection(),
          // HeaderButtonSection(
          //   buttonOne: headerButton(
          //       buttonText: "Like",
          //       buttonIcon: Icons.thumb_up_alt_outlined,
          //       buttonAction: () {
          //         Provider.of<FeedPageController>(context, listen: false)
          //             .likeTapped();
          //       },
          //       buttonColor: Colors.orange),
          //   buttonTwo: headerButton(
          //       buttonText: "Comment",
          //       buttonIcon: Icons.message_outlined,
          //       buttonAction: () {},
          //       buttonColor: Colors.orange),
          //   buttonThree: headerButton(
          //       buttonText: "BookMark",
          //       buttonIcon: Icons.bookmark_add_outlined,
          //       buttonAction: () {},
          //       buttonColor: Colors.orange),
          // )
          SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
      onPressed: (){
        Provider.of<FeedPageController>(context,listen: false).likeTapped(itemId);
      },
      icon: Icon(
        Icons.thumb_up_alt_outlined,
        color: Colors.orange,
      ),
      label: Text(
        "Like",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      )),
          headerButton(
                buttonText: "Comment",
                buttonIcon: Icons.message_outlined,
                buttonAction: () {},
                buttonColor: Colors.orange),
            headerButton(
                buttonText: "BookMark",
                buttonIcon: Icons.bookmark_add_outlined,
                buttonAction: () {},
                buttonColor: Colors.orange),
        ],
      ),
    )
        ],
      ),
    );
  }

  Widget displayText({required String label}) {
    return Text(
      label == null ? "" : label,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
    );
  }

  Widget footerSection() {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    color: Colors.orange, shape: BoxShape.circle),
                child:
                    const Icon(Icons.thumb_up, color: Colors.white, size: 14),
              ),
              const SizedBox(
                width: 4,
              ),
              displayText(label: "$likeCount"),
            ],
          ),
          Row(
            children: [
              displayText(label: "$commentCount"),
              const SizedBox(
                width: 4,
              ),
              displayText(label: "Comments"),
              const SizedBox(
                width: 12,
              ),
              displayText(label: "$shareCount"),
              const SizedBox(
                width: 4,
              ),
              displayText(label: "Bookmarks"),

              // ProfilePics(
              //   displayImage: profPic,
              //   displayStatus: false,
              //   profHeight: 25,
              //   profWidth: 25,
              // ),
              // const SizedBox(
              //   width: 3,
              // ),
              // IconButton(
              //   onPressed: () {
              //     // print("Drop down pressed");
              //   },
              //   icon: Icon(
              //     Icons.arrow_drop_down,
              //     color: Colors.grey[700],
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }

  // Widget imageSection() {
  //   return Container(
  //     padding: const EdgeInsets.only(top: 5, bottom: 5),
  //     child: Image.network(),
  //   );
  // }

  Widget titleSection() {
    return descriptionPosted != null && descriptionPosted != ""
        ? Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(descriptionPosted == null ? "" : descriptionPosted,
                style: const TextStyle(color: Colors.black, fontSize: 16)),
          )
        : const SizedBox();
  }

  // Widget postCardHeader() {
  //   return ListTile(
  //     // leading: ProfilePics(displayImage: profPic, displayStatus: false),
  //     title: Row(
  //       children: [
  //         Text(
  //           name,
  //           style: const TextStyle(color: Colors.black),
  //         ),
  //         const SizedBox(
  //           width: 5,
  //         ),

  //       ],
  //     ),
  //     subtitle: Text(timePosted == null ? "" : timePosted),

  //     trailing: Text("cook Time"),
  //   );
  // }
}

class HeaderButtonSection extends StatelessWidget {
  final Widget buttonOne;
  final Widget buttonTwo;
  final Widget buttonThree;

  const HeaderButtonSection(
      {super.key,
      required this.buttonOne,
      required this.buttonTwo,
      required this.buttonThree});

  @override
  Widget build(BuildContext context) {
    // Widget verticalDivider = VerticalDivider(
    //   thickness: 1,
    //   color: Colors.grey[300],
    // );
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonOne,
          buttonTwo,
          buttonThree,
        ],
      ),
    );
  }
}

Widget headerButton(
    {required String buttonText,
    required IconData buttonIcon,
    required void Function() buttonAction,
    required Color buttonColor}) {
  return TextButton.icon(
      onPressed: buttonAction,
      icon: Icon(
        buttonIcon,
        color: buttonColor,
      ),
      label: Text(
        buttonText,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      ));
}
