import 'package:flutter/material.dart';
import 'package:vividgold_app/utils/uicolors.dart';
import 'package:vividgold_app/utils/uiconstants.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({@required this.text});

  @override
  _DescriptionTextWidgetState createState() => new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf;
  String secondHalf;
  int textLimit = 250;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textLimit) {
      firstHalf = widget.text.substring(0, textLimit);
      secondHalf = widget.text.substring(textLimit, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : new Column(
        children: <Widget>[
          new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new InkWell(
                child: new Text(
                  flag ? UIConstants.show_more : UIConstants.show_less,
                  style: new TextStyle(color: UIColors.showMoreLessColor),
                ),
                onTap: () {
                  setState(() {
                    flag = !flag;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}