import 'package:flutter/material.dart';

import 'chatDetailPage.dart';

class ConvirsationList extends StatefulWidget {
  ConvirsationList({
    super.key,
    required this.full_name,
    required this.messageText,
    required this.imageUrl,
    required this.isMessageRead,
    required this.time,
  });
  String full_name;
  String messageText;
  String imageUrl;
  bool isMessageRead;
  String time;

  @override
  State<ConvirsationList> createState() => _ConvirsationListState();
}

class _ConvirsationListState extends State<ConvirsationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ChatDetailPage.id);
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 10),
        child: Row(children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/scholar.png"),
                // backgroundImage: NetworkImage(widget.imageUrl),
                maxRadius: 30,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.full_name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        widget.messageText,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                            fontWeight: widget.isMessageRead
                                ? FontWeight.bold
                                : FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                widget.time,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ))
        ]),
      ),
    );
  }
}
