import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/widgets/color_item.dart';



class ColorsListView extends StatefulWidget {
   const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();

}

class _ColorsListViewState extends State<ColorsListView> {


  int currentIndex = 0;
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
                BlocProvider.of<AddNoteCubit>(context).color=kColors[index];
                print("index is $index current is $currentIndex");
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
