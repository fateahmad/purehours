import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:purehours/widgets/scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Application> apps = [];
List<String>? addedApps = [];

getAllApps() async {
  apps = await DeviceApps.getInstalledApplications();
}

addToSharedPrefs(String app) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> appname = prefs.getStringList('app_key') ?? [];
  appname.add(app);
  await prefs.setStringList('app_key', appname);
  getAddedApps();
}

getAddedApps() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? appname = prefs.getStringList('app_key');
  addedApps = appname;
  print(addedApps);
}

deleteApp(String app) async {
  final prefs = await SharedPreferences.getInstance();
  getAddedApps();
  List<String> delApps = addedApps ?? [];
  delApps.remove(app);
  prefs.setStringList('app_key', delApps);
}

clearAll() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('app_key');
}

class AppUsageSetting extends StatefulWidget {
  const AppUsageSetting({Key? key}) : super(key: key);

  @override
  State<AppUsageSetting> createState() => _AppUsageSettingState();
}

class _AppUsageSettingState extends State<AppUsageSetting> {
  @override
  void initState() {
    getAllApps();
    getAddedApps();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isAdded = false;
    return CustomScaffold(
      showIcon: false,
      title: 'App Usage Setting',
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: apps.length,
          itemBuilder: (context, index) {
            isAdded = false;
            if (addedApps != null) {
              if (addedApps!.contains(apps[index].packageName)) {
                isAdded = true;
              }
            }
            return Padding(
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
                    apps[index].appName,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: InkWell(
                        onTap: () async {
                          if (addedApps != null) {
                            if (addedApps!.contains(apps[index].packageName)) {
                              await deleteApp(apps[index].packageName);
                            } else {
                              await addToSharedPrefs(apps[index].packageName);
                            }
                          } else {
                            await addToSharedPrefs(apps[index].packageName);
                          }
                          setState(() {});
                        },
                        child: isAdded
                            ? const Icon(
                                Icons.done,
                                color: Colors.red,
                              )
                            : const Icon(Icons.add_circle_outline_outlined)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
