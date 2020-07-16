import 'package:flutter/material.dart';

class ItemStatus extends StatelessWidget {
  final String type;
  final String status;
  final int totalDays;
  final String dateInString;

  const ItemStatus(
      {Key key,
        this.type,
        this.status,
        this.totalDays,
        this.dateInString})
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
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(fontSize: 16),
                        textAlign: TextAlign.left),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: status == "Pending"
                          ? Colors.orange
                          : status == "Approved"
                          ? Colors.green
                          : Colors.red,
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
              SizedBox(
                height: 35.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: FittedBox(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.calendar_today, color: Color(0xFFB2B2B2)),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(dateInString,
                              style: TextStyle(
                                  fontSize: 14.0, color: Color(0xFFB2B2B2)),
                              textAlign: TextAlign.left)
                        ],
                      ),
                    ),
                  ),
                  Text("Total Days : $totalDays",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontSize: 16, color: Color(0xFFB2B2B2)),
                      textAlign: TextAlign.left)
                ],
              )
            ],
          ),
        ));
  }
}
