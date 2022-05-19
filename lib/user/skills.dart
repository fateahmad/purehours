import 'package:flutter/material.dart';
import 'package:purehours/widgets/listviewBuilder.dart';
import 'package:purehours/widgets/scaffold.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    List<String> items = ['Sleeping', 'Coding', 'Sleeping Again'];
    return CustomScaffold(
      title: "Skills",
      parameters: items,
      icon: const Icon(Icons.edit),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              child: ListTile(
                onTap: () => Navigator.of(context).pushNamed('/timerScreen'),
                horizontalTitleGap: 20,
                minVerticalPadding: 25,
                leading: CircleAvatar(
                  radius: 25,
                  child: Text(
                    items[index][0],
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ),
                title: Text(
                  items[index],
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
