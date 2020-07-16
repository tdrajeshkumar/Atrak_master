import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class ItemTeamDailyAttendance extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String designation;
  final String inTime;
  final String outTime;
  final int duration = 8;

  ItemTeamDailyAttendance(
      {@required this.name,
      @required this.imageUrl,
      @required this.designation,
      @required this.inTime,
      @required this.outTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '$name',
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w600,
                              color: AtrakTheme.darkDisplayColor,
                            ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        '$designation',
                        style: Theme.of(context).textTheme.body2.copyWith(
                              fontFamily: 'Work Sans',
                              color: AtrakTheme.greyTextColor,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'In time',
                        style: Theme.of(context).textTheme.body2.copyWith(
                              fontFamily: 'Work Sans',
                              color: AtrakTheme.greyTextColor,
                            ),
                      ),
                      Text(
                        '$inTime',
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w400,
                              color: AtrakTheme.darkDisplayColor,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: AtrakTheme.dividerColor, width: 1.0),
                            right: BorderSide(
                                color: AtrakTheme.dividerColor, width: 1.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Out time',
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontFamily: 'Work Sans',
                                color: AtrakTheme.greyTextColor,
                              ),
                        ),
                        Text(
                          '$outTime',
                          style: Theme.of(context).textTheme.body1.copyWith(
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400,
                                color: AtrakTheme.darkDisplayColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Duration',
                          style: Theme.of(context).textTheme.body2.copyWith(
                                fontFamily: 'Work Sans',
                                color: AtrakTheme.greyTextColor,
                              ),
                        ),
                        Text(
                          '$duration hrs',
                          style: Theme.of(context).textTheme.body1.copyWith(
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400,
                                color: AtrakTheme.darkDisplayColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
