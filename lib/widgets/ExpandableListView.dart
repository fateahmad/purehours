import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  final items, desc;
  const ExpandableWidget({required this.items, required this.desc, Key? key})
      : super(key: key);

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            title: Text(
              widget.items[index],
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              widget.desc[index],
              maxLines: 1,
            ),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: <Widget>[
              ListTile(title: Text(widget.desc[index])),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
          ),
        );
      },
    );
  }
}
