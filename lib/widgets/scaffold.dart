import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Icon icon;
  final bool showIcon;
  final parameters;
  const CustomScaffold(
      {Key? key,
      required this.title,
      required this.body,
      this.showIcon = true,
      this.parameters,
      this.icon = const Icon(Icons.search)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.chat),
          onPressed: () async {
            try {
              dynamic conversationObject = {
                'appId':
                    '3314f1dee264d0b8c9941ff7510c3e3b9', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
              };

              KommunicateFlutterPlugin.buildConversation(conversationObject)
                  .then((clientConversationId) {
                print("Conversation builder success : " +
                    clientConversationId.toString());
              }).catchError((error) {
                print("Conversation builder error : " + error.toString());
              });
            } catch (e) {
              print('Conversation Builder Error: ' + e.toString());
            }
          }),
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: showIcon
                  ? IconButton(
                      onPressed: () {
                        if (parameters == null) {
                          Navigator.of(context).pushNamed('/$title');
                        } else {
                          Navigator.of(context)
                              .pushNamed('/$title', arguments: parameters);
                        }
                      },
                      icon: icon,
                    )
                  : null)
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/back.jpg'),
          fit: BoxFit.cover,
        )),
        child: body,
      ),
    );
  }
}
