import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

class MoodCalendar extends StatefulWidget {
  const MoodCalendar({Key? key}) : super(key: key);

  @override
  State<MoodCalendar> createState() => _MoodCalendarState();
}

class _MoodCalendarState extends State<MoodCalendar> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      showDialogTrackingMood();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
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
        SizedBox(
          height: mediaQuery.height * 0.6,
          child: Expanded(
            child: Container(
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
                  rowHeight: 80,
                  focusedDay: today,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  firstDay: DateTime.utc(2022),
                  lastDay: DateTime.utc(2060)
              ),
            ),
          ),
        )
      ],
    );
  }

  void showDialogTrackingMood() {
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
                          iconMoodButton(pathIcon: "assets/icons/muitoTriste.svg"),
                          const SizedBox(width: 10),
                          iconMoodButton(pathIcon: "assets/icons/maisOuMenosTriste.svg"),
                          const SizedBox(width: 10),
                          iconMoodButton(pathIcon: "assets/icons/medioTriste.svg"),
                          const SizedBox(width: 10),
                          iconMoodButton(pathIcon: "assets/icons/maisOuMenosFeliz.svg"),
                          const SizedBox(width: 10),
                          iconMoodButton(pathIcon: "assets/icons/muitoFeliz.svg"),
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

  Widget iconMoodButton({required String pathIcon}){
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset(pathIcon, height: 40, width: 40),
    );
  }

}
