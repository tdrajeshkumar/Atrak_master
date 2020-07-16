import 'dart:async';

import 'package:atrak/blocs/interactor.dart';
import 'package:atrak/blocs/models/user.dart';
import 'package:atrak/repository/data/beans/employee.dart';
import 'package:atrak/widgets/block_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter/services.dart';

class AtrakBloc implements BlocBase {
  final Interactor _interactor;

  AtrakBloc._(this._interactor);

  //Output Streams
  Stream<DateTime> get currentTime => _interactor.currentTime;

  Stream<User> get user => _interactor.user;

  BehaviorSubject<String> _placeSubject = BehaviorSubject<String>();
  Location _location = new Location();
  StreamSubscription<Map<String, double>> _locationSubscription;

  bool isPermissionChecked = false;

  Stream<Employee> get employee {
    if (!isPermissionChecked) {
      _checkPermission();
    }

    return _interactor.employee;
  }

  Stream<String> get coordinates => _placeSubject.stream;

  factory AtrakBloc(Interactor interactor) {
    return AtrakBloc._(interactor);
  }

  //Input Future
  void updateUser(User user) {
    _interactor.updateUser(user).then((_) {
      print("User Saved Successfully.");
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void dispose() {
    _interactor.close();
    _locationSubscription.cancel();
  }

  void _checkPermission() {
    Permission permission = Permission.WhenInUseLocation;

    _checkLocationPermission(permission).then((hasPermission) {
      if (hasPermission) {
        print("Have Permission to Show the Location");
        initPlatformState();
      } else {
        _checkPermissionStatus(permission).then((status) {
          switch (status) {
            case PermissionStatus.authorized:
              print("Gohead and start the Listerner");
              isPermissionChecked = true;
              initPlatformState();
              break;
            case PermissionStatus.denied:
              print("Permission Dened.");
              _openSettings();
              break;
            case PermissionStatus.restricted:
            case PermissionStatus.deniedNeverAsk:
              print("Permission Restricted. Show Settings Button");
              break;
            default:
              print("Open the Permissino Window");
              _requestPermission(permission).then((status) {
                if (status == PermissionStatus.authorized) {
                  isPermissionChecked = true;
                  print("Gohead and start the Listerner");
                  initPlatformState();
                } else {
                  print("Show Settings Button");
                }
              });
          }
        });
      }
    });
  }

/*  void _startLocationListener() async {
    Map<String, double> _startLocation;
    try {
      var _permission = await _location.hasPermission();
      _startLocation = await _location.getLocation();
      _location.onLocationChanged().listen((data) {
        _getLocation(data);
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission denied');
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        print(
            'Permission denied - please ask the user to enable it from the app settings');
      }
    }
    _startLocation = null;
  }*/

  Future<bool> _checkLocationPermission(Permission permission) {
    return SimplePermissions.checkPermission(permission);
  }

  Future<PermissionStatus> _checkPermissionStatus(Permission permission) {
    return SimplePermissions.getPermissionStatus(permission);
  }

  Future<PermissionStatus> _requestPermission(Permission permission) {
    return SimplePermissions.requestPermission(permission);
  }

  Future<bool> _openSettings() {
    return SimplePermissions.openSettings();
  }



  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      await _location.hasPermission();
      location = await _location.getLocation();
    } on PlatformException catch (e) {
      return;
    }

    _getLocation(location);

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;
  }

  void _getLocation(Map<String, double> data) async {
    // From coordinates
    final coordinates = new Coordinates(data['latitude'], data['longitude']);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print(first.featureName);
    print(first.subLocality);
    _placeSubject.add('${first.subLocality}, ${first.featureName},');
  }

}
