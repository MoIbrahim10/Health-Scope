import 'package:flutter/material.dart';
import 'package:healthscope/components/Patient _bottom_nav_bar.dart';
import 'package:healthscope/enums.dart';
import 'package:healthscope/screens/Patient/PatientChat/P_Message_screen.dart';

class PatientChat extends StatelessWidget {
  static String routeName = "/ Patient Chat";
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
          PatientBottomNavBar(PselectedMenu: MenuState.Patient_Chat),
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
                    builder: (context) => PMessagesScreen(),
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
    name: "Dr Brie Larson",
    lastMessage: "Thanks Dr Brie",
    image: "assets/images/Dr Brie Larson.jpg",
    time: "3m ago",
    isActive: true,
  ),
  ChatClass(
    name: "Dr Bruce Banner",
    lastMessage: "Thanks Dr Bruce",
    image: "assets/images/Dr Bruce BannerHeaderpic.jpg",
    time: "6m ago",
    isActive: false,
  ),
  ChatClass(
    name: "Dr Sarah Clooney",
    lastMessage: "Hello Dr Sarah! I am...",
    image: "assets/images/Dr Sarah Clooney.png",
    time: "8m ago",
    isActive: true,
  ),
  ChatClass(
    name: "Dr Mark Ruffalo",
    lastMessage: "Thnaks doctor :)",
    image: "assets/images/Dr Mark Ruffalo.jpg",
    time: "2h ago",
    isActive: true,
  ),
  ChatClass(
    name: "Dr Natalie Adams",
    lastMessage: "Glad i hel...",
    image: "assets/images/DrNatalieAdamsHeaderPic.jpg",
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
