import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class TeamShiftChangeDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Shift details',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  margin: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://media.licdn.com/dms/image/C5603AQEi2D9wzgWB5w/profile-displayphoto-shrink_200_200/0?e=1547078400&v=beta&t=tZC1A0dDzg5bn3kyqTMLRV1t142FnbYehewnwEARzCQ",
                    ),
                  ),
                ),
                Text(
                  'bala',
                  style: Theme.of(context).textTheme.title.copyWith(
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w600,
                        color: AtrakTheme.darkDisplayColor,
                      ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Staff ID 1234',
                  style: Theme.of(context).textTheme.body2.copyWith(
                        fontFamily: 'Work Sans',
                        color: AtrakTheme.greyTextColor,
                      ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Department',
                              style: Theme.of(context).textTheme.body2.copyWith(
                                    fontFamily: 'Work Sans',
                                    color: AtrakTheme.greyTextColor,
                                  ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              'Date from',
                              style: Theme.of(context).textTheme.body2.copyWith(
                                    fontFamily: 'Work Sans',
                                    color: AtrakTheme.greyTextColor,
                                  ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              'Date to',
                              style: Theme.of(context).textTheme.body2.copyWith(
                                    fontFamily: 'Work Sans',
                                    color: AtrakTheme.greyTextColor,
                                  ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              'Total days',
                              style: Theme.of(context).textTheme.body2.copyWith(
                                    fontFamily: 'Work Sans',
                                    color: AtrakTheme.greyTextColor,
                                  ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              'Reason',
                              style: Theme.of(context).textTheme.body2.copyWith(
                                    fontFamily: 'Work Sans',
                                    color: AtrakTheme.greyTextColor,
                                  ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Software',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(
                                        fontFamily: 'Work Sans',
                                        color: AtrakTheme.darkDisplayColor,
                                      ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                Text(
                                  '06 March 2018',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(
                                        fontFamily: 'Work Sans',
                                        color: AtrakTheme.darkDisplayColor,
                                      ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                Text(
                                  '09 March 2018',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(
                                        fontFamily: 'Work Sans',
                                        color: AtrakTheme.darkDisplayColor,
                                      ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                Text(
                                  '02',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(
                                        fontFamily: 'Work Sans',
                                        color: AtrakTheme.darkDisplayColor,
                                      ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                Text(
                                  'Down with severe cold and body ache',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(
                                        fontFamily: 'Work Sans',
                                        color: AtrakTheme.darkDisplayColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Color(0xFFBABABA),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                        RaisedButton(
                          color: Color(0xFF39B54A),
                          child: Text(
                            'Approve',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
