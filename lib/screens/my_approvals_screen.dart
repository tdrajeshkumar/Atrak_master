import 'package:atrak/blocs/models/approval.dart';
import 'package:atrak/screens/team_leaves_screen.dart';
import 'package:atrak/screens/team_shift_change_screen.dart';
import 'package:atrak/theme.dart';
import 'package:atrak/widgets/item_my_approval_card.dart';
import 'package:flutter/material.dart';

class MyApprovalsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'My Approvals',
          style: TextStyle(
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w600,
              color: AtrakTheme.greyTextColor),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: AtrakTheme.gradientStartColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: AtrakTheme.backgroundColor,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Approvals',
                style: TextStyle(
                  fontFamily: 'Work Sans',
                  fontSize: Theme.of(context).textTheme.title.fontSize,
                  fontWeight: FontWeight.w600,
                  color: AtrakTheme.darkDisplayColor,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ItemMyApprovalCard(
                    data: Approval(
                        icon: Icon(
                          Icons.keyboard,
                          color: Colors.white,
                        ),
                        title: 'Punch regularization',
                        updateCount: 0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeamLeavesScreen()));
                    },
                    child: ItemMyApprovalCard(
                      data: Approval(
                          icon: Icon(
                            Icons.title,
                            color: Colors.white,
                          ),
                          title: 'Leaves',
                          updateCount: 03),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeamShiftChangeScreen()));
                    },
                    child: ItemMyApprovalCard(
                      data: Approval(
                          icon: Icon(
                            Icons.print,
                            color: Colors.white,
                          ),
                          title: 'Shift Change',
                          updateCount: 07),
                    ),
                  ),
                  ItemMyApprovalCard(
                    data: Approval(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        title: 'Permissions',
                        updateCount: 08),
                  ),
                  ItemMyApprovalCard(
                    data: Approval(
                        icon: Icon(
                          Icons.wc,
                          color: Colors.white,
                        ),
                        title: 'Compensatory offs',
                        updateCount: 0),
                  ),
                  ItemMyApprovalCard(
                    data: Approval(
                        icon: Icon(
                          Icons.credit_card,
                          color: Colors.white,
                        ),
                        title: 'Compensatory off credits',
                        updateCount: 0),
                  ),
                  ItemMyApprovalCard(
                    data: Approval(
                        icon: Icon(
                          Icons.work,
                          color: Colors.white,
                        ),
                        title: 'On duty',
                        updateCount: 0),
                  ),
                  ItemMyApprovalCard(
                    data: Approval(
                        icon: Icon(
                          Icons.shop_two,
                          color: Colors.white,
                        ),
                        title: 'Leave donation',
                        updateCount: 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
ListView.builder(
itemCount: approvalsList.length,
itemBuilder: (BuildContext ctxt, int index) {
return ItemMyApprovalCard(
data: approvalsList[index],
);
},
)*/
