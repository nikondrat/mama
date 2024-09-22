import 'package:flutter/material.dart';

class AuthorsSub extends StatelessWidget {
  final String title;
  final String titleAuthor;
  final int count;

  const AuthorsSub({
    super.key,
    required this.title,
    required this.count,
    required this.titleAuthor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/img.png'),
        ),
        SizedBox(width: 10),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(width: 3),
              Container(
                alignment: Alignment.center,
                height: 14,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  titleAuthor,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 40),
        Row(
          children: [
            Text(
              count.toString(),
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            CommonCheckBox(),
          ],
        ),
      ],
    );
  }
}

class SchoolSub extends StatelessWidget {
  final String title;
  final int count;

  const SchoolSub({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/img.png'),
        ),
        SizedBox(width: 10),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(width: 3),
            ],
          ),
        ),
        SizedBox(width: 40),
        Row(
          children: [
            Text(
              count.toString(),
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            CommonCheckBox(),
          ],
        ),
      ],
    );
  }
}

class CommonCheckBox extends StatefulWidget {
  const CommonCheckBox({
    super.key,
  });

  @override
  State<CommonCheckBox> createState() => _CommonCheckBoxState();
}

class _CommonCheckBoxState extends State<CommonCheckBox> {
  bool firstValue = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Color(0xff4D4DE8),
        value: firstValue,
        onChanged: (bool? value) {
          setState(() {
            firstValue = value!;
          });
        });
  }
}

class CommonCheckBoxWidget extends StatefulWidget {
  const CommonCheckBoxWidget({
    super.key,
  });

  @override
  State<CommonCheckBoxWidget> createState() => _CommonCheckBoxWidgetState();
}

class _CommonCheckBoxWidgetState extends State<CommonCheckBoxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: Color(0xff4D4DE8),
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
