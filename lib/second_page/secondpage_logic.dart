


import 'package:hooks_riverpod/hooks_riverpod.dart';
final secondPageStateProvider = StateNotifierProvider<SecondPageStateNotifier, SecondPageBlocData>((ref) => SecondPageStateNotifier(SecondPageBlocData(counter: 0, isLoading: false)));

class SecondPageBlocData {
  final int counter;
  final bool isLoading;
  SecondPageBlocData({required this.counter, required this.isLoading});
}

class SecondPageStateNotifier extends StateNotifier<SecondPageBlocData> {
  SecondPageStateNotifier(SecondPageBlocData state) : super(SecondPageBlocData(counter: 0, isLoading: false));

  int counter = 0;
  bool isLoading = false;

  void triggerState(){
    state = SecondPageBlocData(counter: counter, isLoading: isLoading);
  }

  void increment(){
    counter++;
    triggerState();
  }
  void decrement(){
    counter--;
    triggerState();
  }
}
