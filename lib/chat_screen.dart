import 'package:flutter/material.dart';
import 'api/api.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ApiService apiService = ApiService();
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<Map<String, dynamic>> messages = [];

  bool isLoading = false;

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> sendMessage() async {
    String text = messageController.text.trim();

    if (text.isEmpty) return;

    messageController.clear();

    setState(() {
      messages.add({"text": text, "isUser": true});

      isLoading = true;
    });

    scrollToBottom();

    try {
      // Actual AI Reply from ApiService
      String response = await apiService.sendMessage(text);

      setState(() {
        messages.add({"text": response, "isUser": false});
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        messages.add({"text": "Error: Could not reach AI", "isUser": false});
        isLoading = false;
      });
    }

    scrollToBottom();
  }

  Widget buildMessage(Map<String, dynamic> message) {
    bool isUser = message["isUser"];

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,

      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),

        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: isUser ? Colors.blue : Colors.grey.shade300,

          borderRadius: BorderRadius.circular(18),
        ),

        child: Text(
          message["text"],
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI ChatBot"), centerTitle: true),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return buildMessage(messages[index]);
              },
            ),
          ),

          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            ),

          Padding(
            padding: const EdgeInsets.all(10),

            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,

                    decoration: InputDecoration(
                      hintText: "Ask anything...",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),

                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),

                    onSubmitted: (_) => sendMessage(),
                  ),
                ),

                const SizedBox(width: 10),

                CircleAvatar(
                  radius: 26,

                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
