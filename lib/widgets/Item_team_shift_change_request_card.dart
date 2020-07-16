import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class ItemTeamShiftChangeRequestCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String id;
  final String status;
  final String title;
  final String date;
  final int totalDays;

  ItemTeamShiftChangeRequestCard(
      {@required this.name,
      @required this.imageUrl,
      @required this.id,
      @required this.status,
      @required this.title,
      @required this.date,
      @required this.totalDays});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Staff ID $id',
                        style: Theme.of(context).textTheme.body2.copyWith(
                              fontFamily: 'Work Sans',
                              color: AtrakTheme.greyTextColor,
                            ),
                      ),
                    ],
                  ),
                ),
                status == 'Pending'
                    ? Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF7931E),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFFF7931E),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 15.0),
                        child: Text(
                          '$status',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Work Sans'),
                        ),
                      )
                    : Container(),
                status == 'Cancelled'
                    ? Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF94E4E),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFFF94E4E),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 15.0),
                        child: Text(
                          '$status',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Work Sans'),
                        ),
                      )
                    : Container(),
                status == 'Approved'
                    ? Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF39B54A),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFF39B54A),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 15.0),
                        child: Text(
                          '$status',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Work Sans'),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$title',
              style: Theme.of(context).textTheme.body1.copyWith(
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w600,
                    color: AtrakTheme.darkDisplayColor,
                  ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.calendar_today,
                  color: AtrakTheme.greyTextColor,
                  size: 18.0,
                ),
                SizedBox(
                  width: 3.0,
                ),
                Expanded(
                  child: Text(
                    '$date',
                    style: Theme.of(context).textTheme.body2.copyWith(
                          fontFamily: 'Work Sans',
                          color: AtrakTheme.greyTextColor,
                        ),
                  ),
                ),
                Text(
                  'Total days: $totalDays',
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontFamily: 'Work Sans',
                        color: AtrakTheme.greyTextColor,
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
