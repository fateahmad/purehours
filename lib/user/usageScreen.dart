import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class AppUsageScreen extends StatefulWidget {
  const AppUsageScreen({Key? key}) : super(key: key);

  @override
  State<AppUsageScreen> createState() => _AppUsageScreenState();
}

class _AppUsageScreenState extends State<AppUsageScreen>
    with WidgetsBindingObserver {
  List<AppUsageInfo> _infos = [];
  final service = FlutterBackgroundService();

  @override
  void initState() {
    getUsageStats();
    super.initState();
  }

  void getUsageStats() async {
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(const Duration(hours: 24));
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
