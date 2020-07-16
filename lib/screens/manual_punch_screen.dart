import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class ManualPunchScreen extends StatefulWidget {
  @override
  _ManualPunchScreenState createState() => _ManualPunchScreenState();
}

class _ManualPunchScreenState extends State<ManualPunchScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _textTimeController = TextEditingController();
  int _selectPunch = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textTimeController.dispose();
    super.dispose();
  }

  void _selectPunchChange(value) {
    setState(() {
      _selectPunch = value;
    });
  }

  Future _showTimePicker() async {
    final TimeOfDay selectedTime =
        await showTimePicker(initialTime: TimeOfDay.now(), context: context);
    if (selectedTime != null) {
      _textTimeController.text = selectedTime.format(context);
    }
  }

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
                brightness: Brightness.light,
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                title: Text(
                  "Manual punch",
                  style: Theme.of(context).textTheme.display1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AtrakTheme.greyTextColor,
                      fontSize: 20.0),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.keyboard_backspace,
                    color: AtrakTheme.backArrowColor,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            body: Container(
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
                        height: 45.0,
                        padding: EdgeInsets.only(left: 25.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Manual Punch",
                          style: Theme.of(context).textTheme.display3.copyWith(
                              fontSize: 24.0,
                              color: AtrakTheme.darkDisplayColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Card(
                                      child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Form(
                                              key: _formKey,
                                              child: Column(children: <Widget>[
                                                InputDecorator(
                                                  decoration: InputDecoration(
                                                      hintText: "Staff name"),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      value: null,
                                                      isDense: true,
                                                      onChanged:
                                                          (String newValue) {},
                                                      items: [
                                                        DropdownMenuItem(
                                                            child: Text(
                                                                "Staff name")),
                                                        DropdownMenuItem(
                                                            child:
                                                                Text("Sankar")),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Radio(
                                                        value: 0,
                                                        groupValue:
                                                            _selectPunch,
                                                        onChanged:
                                                            _selectPunchChange,
                                                      ),
                                                      Text(
                                                        'In',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .display1
                                                            .copyWith(
                                                                fontSize: 14),
                                                      ),
                                                      Radio(
                                                        value: 1,
                                                        groupValue:
                                                            _selectPunch,
                                                        onChanged:
                                                            _selectPunchChange,
                                                      ),
                                                      Text(
                                                        'Out',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .display1
                                                            .copyWith(
                                                                fontSize: 14),
                                                      ),
                                                      Radio(
                                                        value: 1,
                                                        groupValue:
                                                            _selectPunch,
                                                        onChanged:
                                                            _selectPunchChange,
                                                      ),
                                                      Text(
                                                        'In-Out',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .display1
                                                            .copyWith(
                                                                fontSize: 14),
                                                      ),
                                                    ]),
                                                InkWell(
                                                    onTap: () =>
                                                        _showTimePicker(),
                                                    child: IgnorePointer(
                                                      child: TextFormField(
                                                        controller:
                                                            _textTimeController,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: "Time",
                                                          labelStyle: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .display1
                                                              .copyWith(
                                                                  fontSize: 16,
                                                                  color: AtrakTheme
                                                                      .greyTextColor),
                                                          suffixIcon: Icon(
                                                              Icons
                                                                  .calendar_today,
                                                              color: AtrakTheme
                                                                  .greyTextColor,
                                                              size: 18.0),
                                                          border: UnderlineInputBorder(
                                                              borderSide: new BorderSide(
                                                                  color: AtrakTheme
                                                                      .greyTextColor)),
                                                          focusedBorder: UnderlineInputBorder(
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
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  decoration: InputDecoration(
                                                    labelText: "Reason",
                                                    labelStyle: Theme.of(
                                                            context)
                                                        .textTheme
                                                        .display1
                                                        .copyWith(
                                                            fontSize: 16,
                                                            color: AtrakTheme
                                                                .greyTextColor),
                                                    border: UnderlineInputBorder(
                                                        borderSide: new BorderSide(
                                                            color: AtrakTheme
                                                                .greyTextColor)),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: new BorderSide(
                                                            color: AtrakTheme
                                                                .greyTextColor)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  20.0)),
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              20.0,
                                                              10.0,
                                                              20.0,
                                                              10.0),
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
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ])))))))
                    ]))));
  }
}
