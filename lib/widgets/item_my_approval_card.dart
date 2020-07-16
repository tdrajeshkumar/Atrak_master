import 'package:atrak/blocs/models/approval.dart';
import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class ItemMyApprovalCard extends StatelessWidget {
  final Approval data;

  ItemMyApprovalCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF36D0DD),
                    Color(0xFF2A4BFF),
                  ],
                ),
              ),
              child: data.icon,
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Text(
                '${data.title}',
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                      color: AtrakTheme.darkDisplayColor,
                    ),
              ),
            ),
            data.updateCount != 0
                ? Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF7931E),
                    ),
                    child: Text(
                      '${data.updateCount}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : Container(),
            Icon(
              Icons.keyboard_arrow_right,
              color: AtrakTheme.darkDisplayColor,
            )
          ],
        ),
      ),
    );
  }
}
