import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../config/app_settings.dart';
import '../../../models/note_model.dart';
import '../../../style/text_style.dart';
import '../../../style/theme.dart';
import '../../../utils/colors.dart';
import '../../customWidgets/customActionBar.dart';
import '../../customWidgets/note_card.dart';
import '../../customWidgets/root_containers.dart';
import '../note_pad_files/create_note/create_note_binding.dart';
import '../note_pad_files/create_note/create_note_view.dart';
import 'dash_board_logic.dart';
import 'dash_board_state.dart';

class DashBoardPage extends StatelessWidget {
  final logic = Get.find<DashBoardLogic>();
  final state = Get
      .find<DashBoardLogic>()
      .state;
  final _buildBody = <Widget>[HomePage(), Text('2'), Text('5')];


  DashBoardPage

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(
        Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.tabSelectedColor,
            title: Text('Note Pad'),
            /* actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 7.5),
                    decoration: BoxDecoration(
                      color: AppColors.priceShowColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: GestureDetector(
                      onTap: ()  {
                        //logic.launchMapsUrl(23.810291306407898, 90.4125444229044);
                        Get.offAll(() => SignInPage(),
                            binding: SignInBinding(),
                            transition: Transition.native,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInBack);
                      },
                      child: Icon(
                        Icons.logout, color: AppColors.splashTextBlack,),
                    ),
                  ),
                ),
              ],*/
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CreateNotePage(onNewNoteCreated: (note ) {  },)));
              Get.to(() =>
                  CreateNotePage(onNewNoteCreated: logic.onNewNoteCreated),
                  binding: CreateNoteBinding(),
                  transition: Transition.native,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInCubic);
            },
            child: Icon(Icons.add),
          ),
          body: _buildBody[state.selectedIndex],
          //bottomNavigationBar: BottomNavBar(state: state),
        )
    );
  }
}


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.state,
  }) : super(key: key);

  void onItemTapped(int index) {
    state.selectedIndex = index;
  }

  final DashBoardState state;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_applications_outlined),
          label: 'Setting',
        ),
      ],
      currentIndex: state.selectedIndex,
      onTap: (index) => onItemTapped(index), //New
      //onTap: onItemTapped,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final logic = Get.find<DashBoardLogic>();
final state = Get
    .find<DashBoardLogic>()
    .state;





class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        color: colorPestLight,
        height: Get.height,
        child: ValueListenableBuilder(
            valueListenable: state.hiveBox.listenable(),
            builder: (context, Box box, child) {
              if (box.isEmpty) {
                return const Center(
                  child: Text('Empty'),
                );
              } else {
                return ListView.builder(
                  //itemCount: state.notes.length ?? 0,
                  itemCount: state.hiveBox.length ?? 0,
                  itemBuilder: (BuildContext context, index) {
                    var helper = state.hiveBox.get(index) as Note;
                    return Text(helper.title);
                  },);
              }
            }));
  }

}
