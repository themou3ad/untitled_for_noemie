


import 'package:hooks_riverpod/hooks_riverpod.dart';
final homePageStateProvider = StateNotifierProvider<HomePageStateNotifier, HomePageBlocData>((ref) => HomePageStateNotifier(HomePageBlocData(counter: 0, isLoading: false)));
class User{
  final String name;
  final String password;

  User({required this.name,required this.password});
}
class HomePageBlocData {
  final int counter;
  final bool isLoading;
  final User? user;
  HomePageBlocData({required this.counter, required this.isLoading, this.user});
}

class HomePageStateNotifier extends StateNotifier<HomePageBlocData> {
  HomePageStateNotifier(HomePageBlocData state) : super(HomePageBlocData(counter: 0, isLoading: false));

  int counter = 0;
  bool isLoading = false;
  User? createdUser;

  void triggerState(){
    state = HomePageBlocData(counter: counter, isLoading: isLoading, user: createdUser);
  }


  void increment(){
    counter++;
    triggerState();
  }
  void decrement(){
    counter--;
    triggerState();
  }

  Future<void> createUser(String user, String password) async {
    isLoading = true;
    triggerState();
    await Future.delayed(Duration(seconds: 10), );
    createdUser = User(password: password, name: user);
    isLoading = false;
    triggerState();
  }
}
