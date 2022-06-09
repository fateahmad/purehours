import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:purehours/utils/notifications.dart';

class AppUsageScreen extends StatefulWidget {
  const AppUsageScreen({Key? key}) : super(key: key);

  @override
  State<AppUsageScreen> createState() => _AppUsageScreenState();
}

List<AppUsageInfo> info = [];

void checkTime() async {
  getUsageStats();
  int j = 0;
  for (final i in info) {
    if (((i.usage - const Duration(minutes: 2))) > const Duration(minutes: 2) &&
        i.appName != 'purehours') {
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

class _AppUsageScreenState extends State<AppUsageScreen>
    with WidgetsBindingObserver {
  final service = FlutterBackgroundService();

  @override
  void initState() {
    getUsageStats();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apps Usage'),
      ),
      body: ListView.builder(
        itemCount: _infos.length,
        itemBuilder: (context, index) {
          return Container(
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
              ),
              trailing: Text(
                _infos[index].usage.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
