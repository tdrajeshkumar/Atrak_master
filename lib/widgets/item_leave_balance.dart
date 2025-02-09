import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class ItemLeaveBalance extends StatelessWidget {
  final String leaveType;
  final int balanceLeave;

  const ItemLeaveBalance({Key key, this.leaveType, this.balanceLeave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        child: Card(
          elevation: 2.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  leaveType,
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                Expanded(
                    child: FittedBox(
                      alignment: Alignment.bottomLeft,
                  fit: BoxFit.fitWidth,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: RichText(
                      text: TextSpan(
                          text: balanceLeave.toString().padLeft(2, '0'),
                          style: Theme.of(context).textTheme.display1.copyWith(
                              fontSize: 100,
                              color: AtrakTheme.textIndicatorColor),children: <TextSpan>[
                                TextSpan(text: "/10", style: Theme.of(context).textTheme.display1.copyWith(
                                    fontSize: 23.0,
                                    color: AtrakTheme.textIndicatorColor),)
                      ]),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        balanceLeave.toString().padLeft(2, '0'),
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.display1.copyWith(
                            fontSize: 65.0,
                            color: AtrakTheme.textIndicatorColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 13.0),
                        child: Text(
                          "/10",
                          style: Theme.of(context).textTheme.display1.copyWith(
                              fontSize: 23.0,
                              color: AtrakTheme.textIndicatorColor),
                        ),
                      )
                    ],
                  )


 */
