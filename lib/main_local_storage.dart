import 'package:atrak/blocs/interactor.dart';
import 'package:atrak/repository/data/local_storage.dart';
import 'package:atrak/repository/data/prod_api_repository.dart';
import 'package:atrak/repository/data/web_client.dart';
import 'package:atrak/repository/repository.dart';
import 'package:flutter/services.dart';
import 'package:atrak/main.dart' as app;
import 'package:sqflite/sqflite.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    app.main(
        interactor: Interactor(Repository(
            repository: ProdDataRepository(
                webClient: WebClient(),
                localStorage: LocalStorage(
                    tag: "__local_storage__",
                    dbPath: getDatabasesPath())))));
  });
}
