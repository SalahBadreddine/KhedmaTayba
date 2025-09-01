import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/him_chatbubble_widget.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/you_chatbubble_widget.dart';
import 'package:intl/intl.dart';

class DeliveryManChatPage extends StatefulWidget {
  const DeliveryManChatPage({super.key});

  @override
  State<DeliveryManChatPage> createState() => _DeliveryManChatPageState();
}

class _DeliveryManChatPageState extends State<DeliveryManChatPage> {
  List<List<dynamic>> chatHistory = [
    ["Are you coming?", "8:10pm", true, true],
    ["Hay, Congratulation for order", "8:11pm", false],
    ["Hey Where are you now?", "8:11pm", true, true],
    ["I’m Coming , just wait ...", "8:12pm", false],
    ["Azraaaaab!!!", "8:13pm", true, false],
  ];
  TextEditingController chatController = TextEditingController();

  String getCurrentTime() { // to be used to give the current time when sending/recieving message
    final now = DateTime.now();
    return DateFormat('h:mma').format(now).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: NavigationWidget(
            icon1: Icons.close,
            title: Text(
              "Robert Fox",
              style: TextStyle(color: AppColors.homeDark, fontSize: 17),
            ),
            suffixicon: SizedBox(),
            onTapLeadingButton: () => Navigator.pop(context),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          width: double.infinity,
          height: 62,
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                CupertinoIcons.smiley,
                color: Color(0xFFAFAFB0),
                fontWeight: FontWeight.bold,
              ),
              suffix: Container(
                width: 42,
                height: 42,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      chatHistory.add([
                        chatController.text,
                        getCurrentTime(),
                        true,
                        false,
                      ]);
                      chatController.text = "";
                    });
                  },
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    CupertinoIcons.paperplane,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              fillColor: AppColors.greyBackgroundColor,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.all(20),
              hintText: "Write something",
            ),
            controller: chatController,
            style: TextStyle(color: Color.fromARGB(255, 119, 119, 119), fontSize: 14),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            spacing: 20,
            children: List.generate(chatHistory.length, (index) {
              return chatHistory.elementAt(index)[2]
                  ? YouChatbubbleWidget(
                      text: chatHistory.elementAt(index).elementAt(0),
                      time: chatHistory.elementAt(index).elementAt(1),
                      isRecieved: chatHistory.elementAt(index).elementAt(3),
                    )
                  : HimChatbubbleWidget(
                      text: chatHistory.elementAt(index).elementAt(0),
                      time: chatHistory.elementAt(index).elementAt(1),
                    );
            }),
          ),
        ),
      ),
    );
  }
}
