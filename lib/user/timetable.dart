import 'package:flutter/material.dart';
import 'package:purehours/widgets/ExpandableListView.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({Key? key}) : super(key: key);

  @override
  State<TimetableScreen> createState() => _TimetableScreen();
}

class _TimetableScreen extends State<TimetableScreen> {
  @override
  Widget build(BuildContext context) {
    //! Get the values in list from data base to dynamically build the list
    List<String> items = [
      'Lab',
      'Software Design',
      'Break',
      'Operating System',
      'Database',
      'Play Games',
    ];
    List<String> desc = [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat, ex a bibendum varius, quam velit sollicitudin lorem, et posuere augue sapien ac metus. Aenean quis dui hendrerit, lobortis dui at, fringilla ante. Suspendisse mauris eros, tincidunt eu pretium at, hendrerit nec tellus. Vestibulum ac convallis diam. Proin blandit massa quis tellus aliquet convallis. Sed pretium sapien ut leo commodo semper. Duis laoreet fermentum velit quis varius. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi id metus et lorem dapibus ullamcorper. Suspendisse potenti. Aliquam ut justo eget ligula euismod egestas et eu orci. Nulla ac arcu at dui accumsan hendrerit in sit amet nibh. Donec eu velit ullamcorper, vestibulum eros condimentum, pretium ante.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat, ex a bibendum varius, quam velit sollicitudin lorem, et posuere augue sapien ac metus. Aenean quis dui hendrerit, lobortis dui at, fringilla ante. Suspendisse mauris eros, tincidunt eu pretium at, hendrerit nec tellus. Vestibulum ac convallis diam. Proin blandit massa quis tellus aliquet convallis. Sed pretium sapien ut leo commodo semper. Duis laoreet fermentum velit quis varius. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi id metus et lorem dapibus ullamcorper. Suspendisse potenti. Aliquam ut justo eget ligula euismod egestas et eu orci. Nulla ac arcu at dui accumsan hendrerit in sit amet nibh. Donec eu velit ullamcorper, vestibulum eros condimentum, pretium ante.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat, ex a bibendum varius, quam velit sollicitudin lorem, et posuere augue sapien ac metus. Aenean quis dui hendrerit, lobortis dui at, fringilla ante. Suspendisse mauris eros, tincidunt eu pretium at, hendrerit nec tellus. Vestibulum ac convallis diam. Proin blandit massa quis tellus aliquet convallis. Sed pretium sapien ut leo commodo semper. Duis laoreet fermentum velit quis varius. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi id metus et lorem dapibus ullamcorper. Suspendisse potenti. Aliquam ut justo eget ligula euismod egestas et eu orci. Nulla ac arcu at dui accumsan hendrerit in sit amet nibh. Donec eu velit ullamcorper, vestibulum eros condimentum, pretium ante.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat, ex a bibendum varius, quam velit sollicitudin lorem, et posuere augue sapien ac metus. Aenean quis dui hendrerit, lobortis dui at, fringilla ante. Suspendisse mauris eros, tincidunt eu pretium at, hendrerit nec tellus. Vestibulum ac convallis diam. Proin blandit massa quis tellus aliquet convallis. Sed pretium sapien ut leo commodo semper. Duis laoreet fermentum velit quis varius. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi id metus et lorem dapibus ullamcorper. Suspendisse potenti. Aliquam ut justo eget ligula euismod egestas et eu orci. Nulla ac arcu at dui accumsan hendrerit in sit amet nibh. Donec eu velit ullamcorper, vestibulum eros condimentum, pretium ante.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat, ex a bibendum varius, quam velit sollicitudin lorem, et posuere augue sapien ac metus. Aenean quis dui hendrerit, lobortis dui at, fringilla ante. Suspendisse mauris eros, tincidunt eu pretium at, hendrerit nec tellus. Vestibulum ac convallis diam. Proin blandit massa quis tellus aliquet convallis. Sed pretium sapien ut leo commodo semper. Duis laoreet fermentum velit quis varius. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi id metus et lorem dapibus ullamcorper. Suspendisse potenti. Aliquam ut justo eget ligula euismod egestas et eu orci. Nulla ac arcu at dui accumsan hendrerit in sit amet nibh. Donec eu velit ullamcorper, vestibulum eros condimentum, pretium ante.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat, ex a bibendum varius, quam velit sollicitudin lorem, et posuere augue sapien ac metus. Aenean quis dui hendrerit, lobortis dui at, fringilla ante. Suspendisse mauris eros, tincidunt eu pretium at, hendrerit nec tellus. Vestibulum ac convallis diam. Proin blandit massa quis tellus aliquet convallis. Sed pretium sapien ut leo commodo semper. Duis laoreet fermentum velit quis varius. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi id metus et lorem dapibus ullamcorper. Suspendisse potenti. Aliquam ut justo eget ligula euismod egestas et eu orci. Nulla ac arcu at dui accumsan hendrerit in sit amet nibh. Donec eu velit ullamcorper, vestibulum eros condimentum, pretium ante.',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pure Hours"),
      ),
      body: ExpandableWidget(items: items, desc: desc),
    );
  }
}
