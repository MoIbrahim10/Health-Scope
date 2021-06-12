import 'package:flutter/material.dart';
import 'package:healthscope/components/Doctor_bottom_nav_bar.dart';
import 'package:healthscope/enums.dart';

import 'package:healthscope/screens/Doctor/Doctor_chat/Message_screen.dart';

class Chat extends StatelessWidget {
  static String routeName = "/Chat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFf7f7f7),
      appBar: AppBar(
        title: Text(
          "Chat",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0XFFEB1555),
        child: Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar:
          DoctorBottomNavBar(selectedMenu: MenuState.DoctorChat),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            color: Color(0XFFEB1555),
            child: Row(
              children: [
                FillOutlineButton(press: () {}, text: "Recent Message"),
                SizedBox(width: 20),
                FillOutlineButton(
                  press: () {},
                  text: "Archived",
                  isFilled: false,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => ChatCard(
                chat: chatsData[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessagesScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FillOutlineButton extends StatelessWidget {
  const FillOutlineButton({
    Key key,
    this.isFilled = true,
    @required this.press,
    @required this.text,
  }) : super(key: key);

  final bool isFilled;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.white),
      ),
      elevation: isFilled ? 2 : 0,
      color: isFilled ? Colors.white : Colors.transparent,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          color: isFilled ? Color(0xFF1D1D35) : Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}

class ChatClass {
  final String name, lastMessage, image, time;
  final bool isActive;

  ChatClass({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  ChatClass(
    name: "Casey Williams",
    lastMessage: "Thanks Dr Brie",
    image: "assets/images/Casey_Gardnerx.png",
    time: "3m ago",
    isActive: false,
  ),
  ChatClass(
    name: "Cole Smith",
    lastMessage: "Hello Dr brie! I am...",
    image: "assets/images/cole.jpg",
    time: "8m ago",
    isActive: true,
  ),
  ChatClass(
    name: "Pam Beesly",
    lastMessage: "Do you have ...",
    image: "assets/images/user_3.png",
    time: "1h ago",
    isActive: false,
  ),
  ChatClass(
    name: "Jacob Jones",
    lastMessage: "Thnaks doctor :)",
    image: "assets/images/user_4.png",
    time: "2h ago",
    isActive: true,
  ),
  ChatClass(
    name: "Albert Flores",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6h ago",
    isActive: false,
  ),
  ChatClass(
    name: "Jenny Wilson",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/userss.png",
    time: "6h ago",
    isActive: false,
  ),
  ChatClass(
    name: "Esther Howard",
    lastMessage: "Hello Dr Brie! I am...",
    image: "assets/images/user_2.png",
    time: "8h ago",
    isActive: true,
  ),
];

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key key,
    @required this.chat,
    @required this.press,
  }) : super(key: key);

  final ChatClass chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20 * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(chat.image),
                ),
                if (chat.isActive)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 3),
                      ),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        chat.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(chat.time),
            ),
          ],
        ),
      ),
    );
  }
}
