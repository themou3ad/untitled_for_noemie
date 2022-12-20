import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/homepage/homepage_logic.dart';
import 'package:untitled/second_page/secondpage_logic.dart';
class SecondPage extends HookConsumerWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secondPageProvider = ref.watch(secondPageStateProvider);
    final homePageProvider = ref.watch(homePageStateProvider);
    return Scaffold(
      appBar: AppBar(title:  Text(homePageProvider.user?.name ?? ''),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(secondPageProvider.counter.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(onPressed: () => ref.read(secondPageStateProvider.notifier).decrement(), child: const Text('-'),),
            ElevatedButton(onPressed: () => ref.read(secondPageStateProvider.notifier).increment(), child: const Text('+'),),
          ],),
          const Divider(),
          Text(homePageProvider.counter.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => ref.read(homePageStateProvider.notifier).decrement(), child: const Text('-'),),
              ElevatedButton(onPressed: () => ref.read(homePageStateProvider.notifier).increment(), child: const Text('+'),),
            ],)
        ],
      ),),
    );
  }
}


