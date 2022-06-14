import 'package:app_usage/app_usage.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:purehours/utils/notifications.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<AppUsageInfo> info = [];
List<String>? addedApps = [];

getAllApps() async {
  List<Application> apps = await DeviceApps.getInstalledApplications();
}

getAddedApps() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? appname = prefs.getStringList('app_key');
  addedApps = appname;
  print(addedApps);
}

void checkTime() async {
  getAddedApps();
  getUsageStats();
  int j = 0;
  for (final i in info) {
    if (((i.usage - const Duration(minutes: 1))) > const Duration(minutes: 1) &&
        i.appName != 'purehours' &&
        addedApps!.contains(i.packageName)) {
      NotificationService().showNotification(j, 'Pure Hours',
          'Its recommended to close ${i.appName} due to longer usage');
    }
    j++;
  }
}

void getUsageStats() async {
  try {
    DateTime endDate = DateTime.now();
    DateTime startDate = endDate.subtract(const Duration(hours: 2));
    List<AppUsageInfo> infoList =
        await AppUsage.getAppUsage(startDate, endDate);
    info = infoList;
    for (var info in infoList) {
      print(info.toString());
    }
  } on AppUsageException catch (exception) {
    print(exception);
  }
}

class AppUsageScreen extends StatefulWidget {
  const AppUsageScreen({Key? key}) : super(key: key);
  static const platform = MethodChannel('com.example.purehours/usage');
  @override
  State<AppUsageScreen> createState() => _AppUsageScreenState();
}

class _AppUsageScreenState extends State<AppUsageScreen>
    with WidgetsBindingObserver {
  final service = FlutterBackgroundService();

  @override
  void initState() {
    getUsageStats();
    getAddedApps();
    super.initState();
  }

  List<AppUsageInfo> _infos = [];

  void getUsageStats() async {
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(const Duration(hours: 2));
      List<AppUsageInfo> infoList =
          await AppUsage.getAppUsage(startDate, endDate);

      setState(() {
        _infos = infoList;
      });
      for (var info in infoList) {
        print(info.toString());
      }
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isAdded = false;
    bool isEmpty = false;
    if (addedApps!.isEmpty) {
      isEmpty = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apps Usage'),
        actions: [
          InkWell(
            onTap: (() {
              Navigator.of(context).pushReplacementNamed('/appUsageSetting');
            }),
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: isEmpty
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/back.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(50),
                    child: Center(
                      child: Text(
                        'No app selected for monitoring\nTip : you can add apps for monitoring using the setting icon above',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/back.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView.builder(
                itemCount: _infos.length,
                itemBuilder: (context, index) {
                  isAdded = false;
                  if (addedApps!.contains(_infos[index].packageName)) {
                    isAdded = true;
                  }

                  return isAdded
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              color: Colors.white,
                            ),
                            child: ListTile(
                              horizontalTitleGap: 20,
                              minVerticalPadding: 25,
                              title: Text(
                                _infos[index].appName.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              trailing: Text(
                                _infos[index].usage.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container();
                },
              ),
            ),
    );
  }
}
