import 'package:foodapp/model/State_Info.dart';
import 'package:foodapp/repository/services.dart';


class ListOfSates_Viewmodel{
  List<StateViewModel> state_name;

  Future<void> fetchSatetname() async{
    final apiResult = await StateInfoRepository().initialRequest();
    // print(apiResult);
    this.state_name = apiResult.map((e) => StateViewModel(e)).toList();

  }
}

class StateViewModel {

  final State_Info state_info_response;

  StateViewModel(this.state_info_response);
}