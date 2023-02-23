abstract class InternetStates {}

class InternetInit extends InternetStates {}

class InternetConnected extends InternetStates {
  bool isConnected=false;

  InternetConnected({required this.isConnected});
}

class InternetDisconnected extends InternetStates {}
