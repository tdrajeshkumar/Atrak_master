import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class PageRequests extends StatefulWidget {
  final double leftPadding = 25.0;
  final String title;

  const PageRequests({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PageRequestsState();
}

class _PageRequestsState extends State<PageRequests> {
  final double padding = 25.0;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final String _fromDate = '';
  final String _toDate = '';

  int _periodSelectors1 = 0;
  int _periodSelectors2 = 0;

  @override
  void initState() {
    super.initState();
  }

  void _handlePeriodSelectorsChange1(int value) {
    setState(() {
      _periodSelectors1 = value;
    });
  }

  void _handlePeriodSelectorsChange2(int value) {
    setState(() {
      _periodSelectors2 = value;
    });
  }

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AtrakTheme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 45.0,
            padding: EdgeInsets.only(left: widget.leftPadding),
            child: Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .display3
                  .copyWith(fontSize: 24.0, color: AtrakTheme.darkDisplayColor),
              textAlign: TextAlign.center,
            ),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.white),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  color: Colors.white),
              margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "From date",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(
                                fontSize: 16, color: AtrakTheme.greyTextColor),
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Color(0xFFB2B2B2),
                        ),
                        border: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFB2B2B2))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFB2B2B2))),
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 0,
                            groupValue: _periodSelectors1,
                            onChanged: _handlePeriodSelectorsChange1,
                          ),
                          new Text(
                            'Full day',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(fontSize: 16),
                          ),
                          Radio(
                            value: 1,
                            groupValue: _periodSelectors1,
                            onChanged: _handlePeriodSelectorsChange1,
                          ),
                          new Text(
                            'First half',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(fontSize: 16),
                          ),
                          Radio(
                            value: 2,
                            groupValue: _periodSelectors1,
                            onChanged: _handlePeriodSelectorsChange1,
                          ),
                          new Text(
                            'Second half',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "To date",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(
                                fontSize: 16, color: AtrakTheme.greyTextColor),
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Color(0xFFB2B2B2),
                        ),
                        border: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFB2B2B2))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFB2B2B2))),
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 0,
                            groupValue: _periodSelectors2,
                            onChanged: _handlePeriodSelectorsChange2,
                          ),
                          new Text(
                            'Full day',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(fontSize: 16),
                          ),
                          Radio(
                            value: 1,
                            groupValue: _periodSelectors2,
                            onChanged: _handlePeriodSelectorsChange2,
                          ),
                          new Text(
                            'First half',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(fontSize: 14),
                          ),
                          Radio(
                            value: 2,
                            groupValue: _periodSelectors2,
                            onChanged: _handlePeriodSelectorsChange2,
                          ),
                          new Text(
                            'Second half',
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Total days",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .copyWith(
                                      fontSize: 16,
                                      color: AtrakTheme.greyTextColor),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Color(0xFFB2B2B2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Color(0xFFB2B2B2))),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Flexible(
                            child: DropdownButtonFormField(
                          items: [],
                          hint: Text('Leave type'),
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(
                                    fontSize: 16,
                                    color: AtrakTheme.greyTextColor),
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Reason",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(
                                fontSize: 16, color: AtrakTheme.greyTextColor),
                        border: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFB2B2B2))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFB2B2B2))),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contact No.",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(
                                fontSize: 16, color: AtrakTheme.greyTextColor),
                        border: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFB2B2B2))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFB2B2B2))),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          textColor: Colors.white,
                          color: Colors.green,
                          onPressed: _submitForm,
                          child: new Text(
                            "Submit",
                            style: Theme.of(context)
                                .textTheme
                                .display1
                                .copyWith(fontSize: 16, color: Colors.white),
                          ),
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
