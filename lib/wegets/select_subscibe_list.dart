import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/language.dart';
import 'package:horoscope_cellcard/controllers/master_controller.dart';
import 'package:horoscope_cellcard/wegets/selected_subscribe_card.dart';
import '../constants/colors.dart';
import '../constants/profile_lists.dart';

class SelectSubscibeList extends StatefulWidget {
  final String route;
  SelectSubscibeList({Key? key, required this.route}) : super(key: key);

  @override
  State<SelectSubscibeList> createState() => _SelectSubscibeListState();
}

class _SelectSubscibeListState extends State<SelectSubscibeList> {
  final MasterController masterController = Get.put(MasterController());

  @override
  void initState() {
    masterController.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 30.0),
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    FeatherIcons.x,
                    size: 18.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  languages[49].kh,
                  style: GoogleFonts.notoSansKhmer(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                )
              ],
            )
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(0.0),
          height: MediaQuery.of(context).size.height * 0.55,
          width: double.infinity,
          child: Obx(() => ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              itemCount: masterController.masterList.length ?? 0,
              itemBuilder: (context, index) {
                return SelectedSubscribeCard(
                  id: masterController.masterList[index].id,
                  name: masterController.masterList[index].enName,
                  img: masterController.masterList[index].profile,
                  price: masterController.masterList[index].feeUsd,
                  contents:
                      "Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enimLorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enimLorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim",
                  isSubscribed: true,
                  route: widget.route,
                );
              })),
        ),
      ]),
    );
  }
}

// class SelectSubscibeList extends StatelessWidget {
//   const SelectSubscibeList({Key? key, required this.route}) : super(key: key);
//   final String route;

//   @override
//   Widget build(BuildContext context) {
//     MasterController _masterController = Get.put(MasterController());

//     return Container(
//       padding: const EdgeInsets.all(0.0),
//       height: MediaQuery.of(context).size.height * 0.65,
//       width: MediaQuery.of(context).size.width,
//       child: Column(children: [
//         Container(
//           padding: const EdgeInsets.only(
//               left: 20.0, right: 20.0, top: 10.0, bottom: 30.0),
//           decoration: BoxDecoration(
//             color: iconColor,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(20.0),
//               topRight: Radius.circular(20.0),
//             ),
//           ),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () => Navigator.of(context).pop(),
//                   child: const Icon(
//                     FeatherIcons.x,
//                     size: 18.0,
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   languages[49].kh,
//                   style: GoogleFonts.notoSansKhmer(
//                       textStyle: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white)),
//                 )
//               ],
//             )
//           ]),
//         ),
//         Container(
//           padding: const EdgeInsets.all(0.0),
//           height: MediaQuery.of(context).size.height * 0.55,
//           width: double.infinity,
//           child: ListView.builder(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//               itemCount: _masterController.masterModel.length ?? 0,
//               itemBuilder: (context, index) {
//                 return SelectedSubscribeCard(
//                   id: 1,
//                   name: "ឡុង បូរ៉ា",
//                   img: profiles[0],
//                   price: 1.5,
//                   contents:
//                       "Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enimLorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enimLorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim",
//                   isSubscribed: true,
//                   route: route,
//                 );
//               }),
//           // child:  ListView(
//           //   padding:
//           //       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//           //   shrinkWrap: false,
//           //   children: [
//           //     SelectedSubscribeCard(
//           //       id: 1,
//           //       name: "ឡុង បូរ៉ា",
//           //       img: profiles[0],
//           //       price: 1.5,
//           //       contents:
//           //           "Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enimLorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enimLorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim",
//           //       isSubscribed: true,
//           //       route: route,
//           //     ),
//           //     SelectedSubscribeCard(
//           //       id: 2,
//           //       name: "ឡុង បូរ៉ា",
//           //       img: profiles[1],
//           //       price: 0.50,
//           //       contents:
//           //           "Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim My 11",
//           //       isSubscribed: false,
//           //       route: route,
//           //     ),
//           //     SelectedSubscribeCard(
//           //       id: 3,
//           //       name: "ឡុង បូរ៉ា",
//           //       img: profiles[0],
//           //       price: 2.40,
//           //       contents:
//           //           "Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim Lorem ipsum dolor sit amet consectetur. At blandit senectus suspendisse massa enim My 12 ",
//           //       isSubscribed: false,
//           //       route: route,
//           //     ),
//           //   ],
//           // ),
//         ),
//       ]),
//     );
//   }
// }
