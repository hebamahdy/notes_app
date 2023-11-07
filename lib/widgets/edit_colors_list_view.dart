import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/widgets/color_item.dart';

class EditColorsListView extends StatefulWidget {
  const EditColorsListView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditColorsListView> createState() => _EditColorsListViewState();
}

class _EditColorsListViewState extends State<EditColorsListView> {

  late int currentIndex;

  @override
  void initState() {
    currentIndex=kColors.indexOf(Color(widget.note.color));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: kColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color=kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                  color: kColors[index],
                  isActive: index == currentIndex ? true : false),
            );
          }),
    );
  }
}
