import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class ActionItem extends StatelessWidget {
  final String action;

  const ActionItem({Key key, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.50 - 30,
        child: Card(
          elevation: 3.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.white,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
              child: Row(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.0),
                          gradient: LinearGradient(colors: [
                            AtrakTheme.gradientStartColor,
                            AtrakTheme.gradientEndColor
                          ])),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.format_align_justify,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(action,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(fontSize: 16)),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
