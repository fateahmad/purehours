import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = "Stop Service";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service App'),
      ),
      body: Column(
        children: [
          StreamBuilder<Map<String, dynamic>?>(
            stream: FlutterBackgroundService().onDataReceived,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final data = snapshot.data!;
              String? device = data["device"];
              DateTime? date = DateTime.tryParse(data["current_date"]);
              return Column(
                children: [
                  Text(device ?? 'Unknown'),
                  Text(date.toString()),
                ],
              );
            },
          ),
          ElevatedButton(
            child: const Text("Foreground Mode"),
            onPressed: () {
              FlutterBackgroundService()
                  .sendData({"action": "setAsForeground"});
            },
          ),
          ElevatedButton(
            child: const Text("Background Mode"),
            onPressed: () {
              FlutterBackgroundService()
                  .sendData({"action": "setAsBackground"});
            },
          ),
          ElevatedButton(
            child: Text(text),
            onPressed: () async {
              final service = FlutterBackgroundService();
              var isRunning = await service.isRunning();
              if (isRunning) {
                service.sendData(
                  {"action": "stopService"},
                );
              } else {
                service.startService();
              }

              if (!isRunning) {
                text = 'Stop Service';
              } else {
                text = 'Start Service';
              }
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
