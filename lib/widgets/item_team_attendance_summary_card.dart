import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ItemTeamAttendanceSummaryCard extends StatelessWidget {
  final String bigText;
  final String subText;
  final bool isTime;
  final String title;

  ItemTeamAttendanceSummaryCard(
      {@required this.bigText,
      @required this.subText,
      @required this.isTime,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              '$title',
              style: TextStyle(color: Color(0xFF4D4D4D)),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  AutoSizeText.rich(
                    TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                          text: '$bigText',
                          style: TextStyle(
                              fontSize: getHeadFontStyle(context),
                              color: Color(0xFF19BCF4)),
                        ),
                        TextSpan(
                          text: '$subText',
                          style: TextStyle(
                              fontSize: getSubTextFontSize(context),
                              color: Color(0xFF19BCF4)),
                        )
                      ],
                    ),
                    style: TextStyle(fontSize: 20.0),
                    minFontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getHeadFontStyle(context) {
    return isTime
        ? Theme.of(context).textTheme.display1.fontSize
        : Theme.of(context).textTheme.display3.fontSize;
  }

  double getSubTextFontSize(context) {
    return isTime
        ? Theme.of(context).textTheme.title.fontSize
        : Theme.of(context).textTheme.display1.fontSize;
  }
}
