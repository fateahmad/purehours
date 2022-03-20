import 'package:flutter/material.dart';

class CustomListviewBuilder extends StatelessWidget {
  final List<String> items;
  final bool push;
  const CustomListviewBuilder({Key? key, required this.items, this.push = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
              onTap: () => push
                  ? Navigator.of(context).pushNamed('/${items[index]}')
                  : null,
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
    );
  }
}
