import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIdex = 0;

  List<Color> colors = [
    kYellow,
    const Color(0xff7AA095),
    const Color(0xff40531B),
    const Color(0xff618B4A),
    const Color(0xffAFBC88),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIdex = index;
              setState(() {});
              BlocProvider.of<AddNoteCubit>(context).color = colors[index];
            },
            child: ColorItem(
              isActive: currentIdex == index,
              color: colors[index],
            ),
          );
        },
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: isActive
          ? CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 25,
              backgroundColor: color,
            ),
    );
  }
}
