import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseEffectDemoPage extends HookWidget {
  const UseEffectDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // useStateでローカルの状態を作成
    final counter = useState(0);
    final color = useState(Colors.red);

    // useEffectで初期化できる
    useEffect(() {
      // ここに初期化処理を書く
      debugPrint('initialize');
      return null;
    }, []);

    // useEffectで状態の変更を監視できる
    useEffect(() {
      // ここに状態の変更を監視する処理を書く
      color.value = counter.value % 2 == 0 ? Colors.red : Colors.blue;
      return null;
    }, [counter.value]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('UseEffectDemo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: color.value,
                  ),
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
