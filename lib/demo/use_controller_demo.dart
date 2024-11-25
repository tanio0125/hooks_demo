import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseControllerPage extends HookWidget {
  const UseControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// useTextEditingControllerを使うことで、TextEditingControllerを作成できる
    /// このコントローラーは、このWidgetがdisposeされるときに自動的にdisposeされる
    final textController = useTextEditingController();

    // 他にもいくつかのコントローラーが用意されている
    final hoge = useAnimationController();
    final fuga = useExpansionTileController();
    final piyo = useScrollController();

    // 用意されてないコントローラーはカスタムHookでコントローラーを作成することもできる
    final custom = useFixedExtentScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('UseControllerPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: TextField(
            controller: textController,
          ),
        ),
      ),
    );
  }
}

/// カスタムフックを作成することもできる
FixedExtentScrollController useFixedExtentScrollController({
  int initialItem = 0,
}) {
  return use(_FixedExtentScrollControllerHook(initialItem: initialItem));
}

class _FixedExtentScrollControllerHook
    extends Hook<FixedExtentScrollController> {
  const _FixedExtentScrollControllerHook({required this.initialItem});
  final int initialItem;

  @override
  _FixedExtentScrollControllerHookState createState() =>
      _FixedExtentScrollControllerHookState();
}

class _FixedExtentScrollControllerHookState extends HookState<
    FixedExtentScrollController, _FixedExtentScrollControllerHook> {
  late FixedExtentScrollController _controller;
  late int initialItem;

  @override
  void initHook() {
    super.initHook();
    initialItem = hook.initialItem;
    _controller = FixedExtentScrollController(initialItem: initialItem);
  }

  @override
  FixedExtentScrollController build(BuildContext context) {
    // 初期アイテムが変更された場合、コントローラーを更新
    if (initialItem != hook.initialItem) {
      _controller.dispose();
      initialItem = hook.initialItem;
      _controller = FixedExtentScrollController(initialItem: initialItem);
    }
    return _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // shouldRebuildメソッドは引数なしで実装
  @override
  bool shouldRebuild() => false;
}
