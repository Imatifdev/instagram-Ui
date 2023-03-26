// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instaui/model/profiledata.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Instagram ",
          style: TextStyle(
              fontFamily: 'Fontspring-DEMO-blue_vinyl_regular_ps_ot',
              fontSize: 30),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.favorite_border_outlined),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage('assets/images/chat.png'),
                  size: 20,
                ),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 130,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: UsersData.users.length,
                  itemBuilder: (context, index) {
                    return ShowItem(
                      userStory: UsersData.users[index],
                    );
                  }),
            ),
            SizedBox(
              height: 1000,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: UsersData.users.length,
                  itemBuilder: (context, index) {
                    return ShowPosts(
                      userPost: UsersData.users[index],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ShowItem extends StatelessWidget {
  final UserProfile userStory;

  const ShowItem({super.key, required this.userStory});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 04, vertical: 10),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(userStory.url),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 04, vertical: 10),
          child: Text(
            userStory.name,
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}

class ShowPosts extends StatefulWidget {
  final UserProfile userPost;

  const ShowPosts({super.key, required this.userPost});

  @override
  State<ShowPosts> createState() => _ShowPostsState();
}

class _ShowPostsState extends State<ShowPosts> {
  bool isClicked = false;
  void fav() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(widget.userPost.url),
                  ),
                ),
                Text(
                  widget.userPost.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      showBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.share,
                                                size: 28,
                                              )),
                                        ),
                                        Text(
                                          "Link",
                                          style: TextStyle(fontSize: 18),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: ImageIcon(
                                              AssetImage(
                                                  'assets/images/link.png'),
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Link",
                                          style: TextStyle(fontSize: 18),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: ImageIcon(
                                              AssetImage(
                                                  'assets/images/save.png'),
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Save",
                                          style: TextStyle(fontSize: 18),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: ImageIcon(
                                              AssetImage(
                                                  'assets/images/qr-code.png'),
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "QR Code",
                                          style: TextStyle(fontSize: 18),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: ImageIcon(AssetImage('assets/images/menu.png')))
              ],
            )
          ],
        ),
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(widget.userPost.url),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: fav,
                    child: isClicked
                        ? Icon(
                            Icons.favorite_border_outlined,
                            size: 35,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 35,
                          ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ImageIcon(
                    AssetImage(
                      'assets/images/coment.png',
                    ),
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ImageIcon(
                    AssetImage(
                      'assets/images/send.png',
                    ),
                    size: 30,
                  ),
                ],
              ),
              Row(
                children: [
                  ImageIcon(
                    AssetImage(
                      'assets/images/save.png',
                    ),
                    size: 35,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
