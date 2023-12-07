// ignore: file_names
import 'package:chatapp/ChatMessage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmit(String text) {
    _textEditingController.clear();
    ChatMessage messages = new ChatMessage(text: text);
    setState(() {
      _messages.insert(0, messages);
    });
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: const IconThemeData(
        color: Colors.blue,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: const InputDecoration(hintText: "Send a message"),
                controller: _textEditingController,
                onSubmitted: _handleSubmit,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmit(_textEditingController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (BuildContext context, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
