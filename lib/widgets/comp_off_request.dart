import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompOffRequest extends StatefulWidget {
  final double leftPadding = 25.0;
  final String title;

  CompOffRequest({Key key, @required this.title}) : super(key: key);

  @override
  _CompOffRequestState createState() => _CompOffRequestState();
}

class _CompOffRequestState extends State<CompOffRequest> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final _textDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textDateController.dispose();
    super.dispose();
  }

  void _submitForm() {}

  Future _showDatePicker() async {
    final DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(DateTime.now().year + 1));
    if (selectedDate != null) {
      _textDateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
    }
  }

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
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.only(left: widget.leftPadding),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.display3.copyWith(
                      fontSize: 24.0, color: AtrakTheme.darkDisplayColor),
                  textAlign: TextAlign.center,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Card(
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    InkWell(
                                        onTap: () => _showDatePicker(),
                                        child: IgnorePointer(
                                          child: TextFormField(
                                            controller: _textDateController,
                                            decoration: InputDecoration(
                                              labelText: "Worked date",
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .display1
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color: AtrakTheme
                                                          .greyTextColor),
                                              suffixIcon: Icon(
                                                  Icons.calendar_today,
                                                  color:
                                                      AtrakTheme.greyTextColor,
                                                  size: 18.0),
                                              border: UnderlineInputBorder(
                                                  borderSide: new BorderSide(
                                                      color: AtrakTheme
                                                          .greyTextColor)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: new BorderSide(
                                                          color: AtrakTheme
                                                              .greyTextColor)),
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    TextFormField(
                                      maxLines: null,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        labelText: "Reason",
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .display1
                                            .copyWith(
                                                fontSize: 16,
                                                color:
                                                    AtrakTheme.greyTextColor),
                                        border: UnderlineInputBorder(
                                            borderSide: new BorderSide(
                                                color:
                                                    AtrakTheme.greyTextColor)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: new BorderSide(
                                                color:
                                                    AtrakTheme.greyTextColor)),
                                      ),
                                    ),
                                    SizedBox(height: 15.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      20.0)),
                                          padding: EdgeInsets.fromLTRB(
                                              20.0, 10.0, 20.0, 10.0),
                                          textColor: Colors.white,
                                          color: Colors.green,
                                          onPressed: _submitForm,
                                          child: new Text(
                                            "Submit",
                                            style: Theme.of(context)
                                                .textTheme
                                                .display1
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ))))),
              )
            ]));
  }
}
