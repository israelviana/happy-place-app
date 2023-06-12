import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_place/repository/shared_preferences_repository.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class MoodCalendar extends StatefulWidget {
  const MoodCalendar({Key? key}) : super(key: key);

  @override
  State<MoodCalendar> createState() => _MoodCalendarState();
}

class _MoodCalendarState extends State<MoodCalendar> {
  DateTime today = DateTime.now();
  List<String> listDaysSelected = [];
  Future? dataPreferences;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      showDialogTrackingMood(day: day);
    });
  }


  Future<void> _saveDataDay({required DateTime day}) async{
    String date = DateFormat('yyyy-MM-dd').format(day);
    if(!listDaysSelected.contains(date)){
      setState(() {
        listDaysSelected.add(date);
      });
    }
    await SharedPreferencesRepository().saveDaySelected(listDays: listDaysSelected).whenComplete(() {
      Navigator.pop(context);
    });
  }

  Future<List> _getDataDay() async{
    await SharedPreferencesRepository().getSaveDaySelected().then((value) {
      setState(() {
        if(value.isNotEmpty){
          listDaysSelected = value;
        }
      });
    });
    return listDaysSelected;
  }

  bool _compareDay({required DateTime day}){
    String date = DateFormat('yyyy-MM-dd').format(day);
    return listDaysSelected.contains(date);
  }

  @override
  void initState() {
    super.initState();
    dataPreferences = _getDataDay();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'RASTREADOR DE\n',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: 'HUMOR',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FutureBuilder(
              future: dataPreferences,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  return Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF372A28),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: TableCalendar(
                        locale: "en_US",
                        headerStyle: const HeaderStyle(formatButtonVisible: false, formatButtonShowsNext: false, titleCentered: true),
                        onDaySelected: _onDaySelected,
                        calendarStyle: const CalendarStyle(
                          weekendTextStyle: TextStyle(
                              color: Color(0xFF17A1FA)
                          ),
                          disabledTextStyle: TextStyle(
                              color: Color(0xFF616161)
                          ),
                          defaultTextStyle: TextStyle(
                              color: Color(0xFFB3B3B3)
                          ),
                        ),
                        rowHeight: 78,
                        focusedDay: today,
                        selectedDayPredicate: (day) => _compareDay(day: day),
                        firstDay: DateTime.utc(2022),
                        lastDay: DateTime.utc(2060)
                    ),
                  );
                }else{
                  return const CircularProgressIndicator();
                }
              }
          )
        ],
      ),
    );
  }

  void showDialogTrackingMood({required DateTime day}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return Dialog(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.0), bottom: Radius.circular(20.0))),
                backgroundColor: const Color(0xFFFFF4EA),
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 32),
                  height: 193,
                  width: 355,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                      ),
                      color: Color(0xFFFFF4EA)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AutoSizeText("Como está o seu humor?", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF372A28)
                      )),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconMoodButton(pathIcon: "assets/icons/muitoTriste.svg", day: day),
                          const SizedBox(width: 10),
                          iconMoodButton(pathIcon: "assets/icons/maisOuMenosTriste.svg", day: day),
                          const SizedBox(width: 10),
                          iconMoodButton(pathIcon: "assets/icons/medioTriste.svg", day: day),
                          const SizedBox(width: 10),
                          iconMoodButton(pathIcon: "assets/icons/maisOuMenosFeliz.svg", day: day),
                          const SizedBox(width: 10),
                          iconMoodButton(pathIcon: "assets/icons/muitoFeliz.svg", day: day),
                        ],
                      )
                    ],
                  )
                )
            );
          },
        );
      },
    );
  }

  Widget iconMoodButton({required String pathIcon, required DateTime day}){
    return GestureDetector(
      onTap: () async {
        await _saveDataDay(day: day);
      },
      child: SvgPicture.asset(pathIcon, height: 40, width: 40),
    );
  }

}
