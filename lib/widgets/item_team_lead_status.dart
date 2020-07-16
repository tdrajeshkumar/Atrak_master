import 'package:flutter/material.dart';

class ItemTeamLeadStatus extends StatelessWidget {
  final String type;
  final String status;
  final String totalHours;
  final String dateInString;
  final String timeInString;
  final bool isCompOff;

  const ItemTeamLeadStatus(
      {Key key,
      this.type,
      this.status,
      this.totalHours,
      this.dateInString,
      this.timeInString,
      this.isCompOff = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(type,
                        style: Theme.of(context).textTheme.display1.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: status == "Pending"
                          ? Colors.orange
                          : status == "Approved" ? Colors.green : Colors.red,
                    ),
                    child: Text(status,
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(fontSize: 12, color: Colors.white),
                        textAlign: TextAlign.right),
                  )
                ],
              ),
              FittedBox(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today,
                        color: Color(0xFFB2B2B2), size: 15.0),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(dateInString,
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xFFB2B2B2)),
                        textAlign: TextAlign.left)
                  ],
                ),
              ),
              !isCompOff
                  ? Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: FittedBox(
                                child: Text(timeInString,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFFB2B2B2),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            FittedBox(
                              child: Text("Total Hours : $totalHours",
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(
                                          fontSize: 16,
                                          color: Color(0xFFB2B2B2),
                                          fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left),
                            )
                          ],
                        )
                      ],
                    )
                  : Container()
            ],
          ),
        ));
  }
}
