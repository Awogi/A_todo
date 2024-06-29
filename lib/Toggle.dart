import 'package:flutter/material.dart';
class TogglingCircularIcon extends StatelessWidget {
   final bool ischecked;
  final VoidCallback toggleCheck ;
  const TogglingCircularIcon({  Key? key,
    required this.ischecked,
    required this.toggleCheck,}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
           onTap: toggleCheck,
           child: CircleAvatar(
            radius: 12,
            backgroundColor:  const Color.fromARGB(255, 176, 39, 169),
            child: Icon(
              ischecked ? Icons.check:Icons.circle,
              color:Colors.white,
            ),
           ),
    );
  }
}