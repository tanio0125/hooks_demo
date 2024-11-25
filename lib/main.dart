import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_demo/demo/use_controller_demo.dart';
import 'package:hooks_demo/demo/use_effect_demo.dart';
import 'package:hooks_demo/demo/use_state_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainDemoPage(),
    );
  }
}

class MainDemoPage extends HookWidget {
  const MainDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Demo Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _createButton(
              title: 'UseState Demo',
              page: const UseStateDemoPage(),
            ),
            _createButton(
              title: 'UseEffect Demo',
              page: const UseEffectDemoPage(),
            ),
            _createButton(
              title: 'UseController Demo',
              page: const UseControllerPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createButton({
    required String title,
    required Widget page,
  }) {
    // useContextでBuildContextを取得できる
    final context = useContext();
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        title,
        style:
            Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.blue),
      ),
    );
  }
}
