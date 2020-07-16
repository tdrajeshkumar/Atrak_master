import 'package:atrak/theme.dart';
import 'package:atrak/widgets/Item_team_leave_request_card.dart';
import 'package:flutter/material.dart';

class PageTeamShiftChangePastRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEF0F2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Past Requests',
              style: TextStyle(
                fontFamily: 'Work Sans',
                fontSize: Theme.of(context).textTheme.title.fontSize,
                fontWeight: FontWeight.w600,
                color: AtrakTheme.darkDisplayColor,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: false,
                activeColor: Colors.green,
                onChanged: (bool value) {},
              ),
              Expanded(
                child: ItemTeamLeaveRequestCard(
                  imageUrl:
                      'https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg',
                  name: 'Bala',
                  title: 'shift change',
                  date: 'Nov 12 - Nov 14 2018',
                  id: '1002',
                  status: 'Cancelled',
                  totalDays: 2,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: false,
                activeColor: Colors.green,
                onChanged: (bool value) {},
              ),
              Expanded(
                child: ItemTeamLeaveRequestCard(
                  imageUrl:
                      'https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg',
                  name: 'Bala',
                  title: 'shift change',
                  date: 'Nov 12 - Nov 14 2018',
                  id: '1002',
                  status: 'Approved',
                  totalDays: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
