import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PermissionRequest extends StatefulWidget {
  final double leftPadding = 25.0;
  final String title;

  PermissionRequest({Key key, @required this.title}) : super(key: key);

  @override
  _PermissionRequestState createState() => _PermissionRequestState();
}

class _PermissionRequestState extends State<PermissionRequest> {
  final _textDateController = TextEditingController();
  final _textFromTimeController = TextEditingController();
  final _textToTimeController = TextEditingController();

  final GlobalKey<FormState> _requestFormKey = new GlobalKey<FormState>();
  int _permissionType = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textDateController.dispose();
    _textFromTimeController.dispose();
    _textToTimeController.dispose();
    super.dispose();
  }

  void _handlePermissionTypeChange(value) {
    setState(() {
      _permissionType = value;
    });
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

  Future _showFromTimePicker() async {
    final TimeOfDay selectedTime =
        await showTimePicker(initialTime: TimeOfDay.now(), context: context);
    if (selectedTime != null) {
      _textFromTimeController.text = selectedTime.format(context);
    }
  }

  Future _showToTimePicker() async {
    final TimeOfDay selectedTime =
        await showTimePicker(initialTime: TimeOfDay.now(), context: context);
    if (selectedTime != null) {
      _textToTimeController.text = selectedTime.format(context);
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
                height: 10.0,
              ),
              Container(
                height: 45.0,
                padding: EdgeInsets.only(left: widget.leftPadding),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.display3.copyWith(
                      fontSize: 24.0, color: AtrakTheme.darkDisplayColor),
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
                          key: _requestFormKey,
                          child: ListView(children: <Widget>[
                            InkWell(
                                onTap: () => _showDatePicker(),
                                child: IgnorePointer(
                                  child: TextFormField(
                                    controller: _textDateController,
                                    decoration: InputDecoration(
                                      labelText: "Date",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .display1
                                          .copyWith(
                                              fontSize: 16,
                                              color: AtrakTheme.greyTextColor),
                                      suffixIcon: Icon(Icons.calendar_today,
                                          color: AtrakTheme.greyTextColor,
                                          size: 18.0),
                                      border: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: AtrakTheme.greyTextColor)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: AtrakTheme.greyTextColor)),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 15.0,
                            ),
                            InkWell(
                                onTap: () => _showFromTimePicker(),
                                child: IgnorePointer(
                                  child: TextFormField(
                                    controller: _textFromTimeController,
                                    decoration: InputDecoration(
                                      labelText: "From time",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .display1
                                          .copyWith(
                                              fontSize: 16,
                                              color: AtrakTheme.greyTextColor),
                                      // suffixIcon: Icon(
                                      //   Icons.calendar_today,
                                      //   color: AtrakTheme.greyTextColor,
                                      //   size: 18.0
                                      // ),
                                      border: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: AtrakTheme.greyTextColor)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: AtrakTheme.greyTextColor)),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 15.0,
                            ),
                            InkWell(
                                onTap: () => _showToTimePicker(),
                                child: IgnorePointer(
                                  child: TextFormField(
                                    controller: _textToTimeController,
                                    decoration: InputDecoration(
                                      labelText: "To time",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .display1
                                          .copyWith(
                                              fontSize: 16,
                                              color: AtrakTheme.greyTextColor),
                                      // suffixIcon: Icon(
                                      //   Icons.calendar_today,
                                      //   color: AtrakTheme.greyTextColor,
                                      //   size: 18.0
                                      // ),
                                      border: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: AtrakTheme.greyTextColor)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: AtrakTheme.greyTextColor)),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 30.0,
                            ),
                            Row(children: <Widget>[
                              Text(
                                "Permitted hours",
                                style: Theme.of(context)
                                    .textTheme
                                    .display4
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: AtrakTheme.greyTextColor),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text("-- : --",
                                      style: Theme.of(context)
                                          .textTheme
                                          .display4
                                          .copyWith(
                                              fontSize: 16.0,
                                              color: AtrakTheme.greyTextColor)),
                                ),
                              )
                            ]),
                            SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              "Permission type",
                              style: Theme.of(context)
                                  .textTheme
                                  .display4
                                  .copyWith(
                                      fontSize: 16.0,
                                      color: AtrakTheme.greyTextColor),
                            ),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Radio(
                                    value: 0,
                                    groupValue: _permissionType,
                                    onChanged: _handlePermissionTypeChange,
                                  ),
                                  Text(
                                    'Shift start',
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(fontSize: 10),
                                  ),
                                  Radio(
                                    value: 1,
                                    groupValue: _permissionType,
                                    onChanged: _handlePermissionTypeChange,
                                  ),
                                  Text(
                                    'Between shift',
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(fontSize: 10),
                                  ),
                                  Radio(
                                    value: 2,
                                    groupValue: _permissionType,
                                    onChanged: _handlePermissionTypeChange,
                                  ),
                                  Text(
                                    'Shift end',
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(fontSize: 10),
                                  ),
                                ],
                              ),
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
                                        color: AtrakTheme.greyTextColor),
                                border: UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: AtrakTheme.greyTextColor)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: AtrakTheme.greyTextColor)),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Contact No",
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        fontSize: 16,
                                        color: AtrakTheme.greyTextColor),
                                border: UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: AtrakTheme.greyTextColor)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: AtrakTheme.greyTextColor)),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0)),
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
                                            fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ]))))
            ]));
  }
}
