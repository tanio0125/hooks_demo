import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStateDemoPage extends HookWidget {
  const UseStateDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // useStateでローカルの状態を作成
    final counter = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('UseStateDemoPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter :',
            ),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // setStateを使わずにリビルドをかけれる
        onPressed: () => counter.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
