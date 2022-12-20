import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/homepage/homepage_logic.dart';
import 'package:untitled/second_page/socondpage.dart';

class Home extends HookConsumerWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homepageProvider = ref.watch(homePageStateProvider);
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final fakeString = useState<String>('');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(homepageProvider.counter.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      ref.read(homePageStateProvider.notifier).decrement(),
                      // ref.read(homePageStateProvider.notifier).decrement(),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(homePageStateProvider.notifier).increment(),
                  child: const Text('+'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SecondPage())),
              child: const Text('go page 2'),
            ),
            const Divider(),
            TextField(controller: usernameController,),
            TextField(controller: passwordController,),
            homepageProvider.isLoading ? CircularProgressIndicator() : ElevatedButton(
              onPressed: () async {
                try{
                  await ref.read(homePageStateProvider.notifier).createUser(usernameController.text, passwordController.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SecondPage()));
                } catch(e){
                  final snackBar = SnackBar(content: Text(e.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  print(e);
                }
              },
              child: const Text('create user'),
            ),
          ],
        ),
      ),
    );
  }
}
