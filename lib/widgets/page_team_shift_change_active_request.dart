import 'package:atrak/screens/team_leave_details_screen.dart';
import 'package:atrak/screens/team_shift_change_details_screen.dart';
import 'package:atrak/theme.dart';
import 'package:atrak/widgets/Item_team_leave_request_card.dart';
import 'package:atrak/widgets/Item_team_shift_change_request_card.dart';
import 'package:flutter/material.dart';

class PageTeamShiftChangeActiveRequest extends StatelessWidget {
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
              'Active Requests',
              style: TextStyle(
                fontFamily: 'Work Sans',
                fontSize: Theme.of(context).textTheme.title.fontSize,
                fontWeight: FontWeight.w600,
                color: AtrakTheme.darkDisplayColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: false,
                  activeColor: Colors.green,
                  onChanged: (bool value) {},
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TeamShiftChangeDetailsScreen()));
                    },
                    child: ItemTeamShiftChangeRequestCard(
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
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: false,
                  activeColor: Colors.green,
                  onChanged: (bool value) {},
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TeamShiftChangeDetailsScreen()));
                    },
                    child: ItemTeamShiftChangeRequestCard(
                      imageUrl:
                          'https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg',
                      name: 'Bala',
                      title: 'shift change',
                      date: 'Nov 12 - Nov 14 2018',
                      id: '1002',
                      status: 'Pending',
                      totalDays: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
