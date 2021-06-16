

import 'package:adopt_ta_waifu/models/Waifu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum WaifuEvent {RECEIVE, NORECEIVE}

class WaifuBloc extends Bloc<WaifuEvent, Waifu>{
  WaifuBloc(Waifu initialState) : super(initialState);

  @override
  Stream<Waifu> mapEventToState(WaifuEvent event) async* {
    switch(event) {
      case WaifuEvent.RECEIVE:
        // TODO: Handle this case.
        break;
      case WaifuEvent.NORECEIVE:
        // TODO: Handle this case.
        break;
    }
  }
  
}