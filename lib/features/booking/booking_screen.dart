import 'package:flutter/material.dart';
import 'package:health_tech/core/styles/colors_managers.dart';
import 'package:health_tech/core/widgets/primary_buttom.dart';
import 'package:health_tech/features/booking/appointment_confirmed_screen.dart';
import 'package:health_tech/features/doctors/models/doctor_model.dart';

class BookingScreen extends StatefulWidget {
  final DoctorModel doctor;
  const BookingScreen({super.key, required this.doctor});
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedMonth = DateTime.now();
  String? _selectedTime;

  final List<String> _timeSlots = [
    '1:00 pm',
    '2:00 pm',
    '3:00 pm',
    '4:00 pm',
    '5:00 pm',
    '6:00 pm',
    '7:00 pm',
    '7:30 pm',
    '8:00 pm',
    '8:30 pm',
    '9:00 pm',
    '9:30 pm',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Booking',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select  Date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Calendar
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.primaryColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: _buildCalendar(),
            ),

            const SizedBox(height: 24),

            const Text(
              'Select  Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),
              itemCount: _timeSlots.length,
              itemBuilder: (context, index) {
                final time = _timeSlots[index];
                final isSelected = _selectedTime == time;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTime = time),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? ColorManager.primaryColor
                          : Colors.white,
                      border: Border.all(
                        color: isSelected
                            ? ColorManager.primaryColor
                            : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      time,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            PraimaryButtom(
              text: 'Make Appointment',
              onpressed: () {
                if (_selectedTime == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a time slot')),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppointmentConfirmedScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    final daysInMonth = DateUtils.getDaysInMonth(
      _focusedMonth.year,
      _focusedMonth.month,
    );
    final firstDayOfMonth = DateTime(
      _focusedMonth.year,
      _focusedMonth.month,
      1,
    );
    // 0=Mon, 6=Sun  → shift so Monday=0
    final startWeekday = (firstDayOfMonth.weekday - 1) % 7;

    final monthName = _monthName(_focusedMonth.month);
    final dayNames = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

    return Column(
      children: [
        // Month header
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () => setState(() {
                  _focusedMonth = DateTime(
                    _focusedMonth.year,
                    _focusedMonth.month - 1,
                  );
                }),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  monthName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () => setState(() {
                  _focusedMonth = DateTime(
                    _focusedMonth.year,
                    _focusedMonth.month + 1,
                  );
                }),
              ),
            ],
          ),
        ),

        // Day names header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              // Week number placeholder
              SizedBox(width: 30),
              ...dayNames.map(
                (d) => Expanded(
                  child: Center(
                    child: Text(
                      d,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: (d == 'Sa' || d == 'Su')
                            ? ColorManager.primaryColor
                            : Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 4),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: _buildDaysGrid(daysInMonth, startWeekday),
        ),

        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildDaysGrid(int daysInMonth, int startWeekday) {
    List<Widget> weeks = [];
    int day = 1;
    int weekNumber = _weekNumber(
      DateTime(_focusedMonth.year, _focusedMonth.month, 1),
    );

    while (day <= daysInMonth) {
      List<Widget> weekDays = [];
      for (int col = 0; col < 7; col++) {
        if (weeks.isEmpty && col < startWeekday) {
          weekDays.add(const Expanded(child: SizedBox()));
        } else if (day > daysInMonth) {
          weekDays.add(const Expanded(child: SizedBox()));
        } else {
          final currentDay = DateTime(
            _focusedMonth.year,
            _focusedMonth.month,
            day,
          );
          final isSelected = DateUtils.isSameDay(currentDay, _selectedDay);
          final isToday = DateUtils.isSameDay(currentDay, DateTime.now());
          final isWeekend = col == 5 || col == 6;
          final d = day;

          weekDays.add(
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selectedDay = currentDay),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ColorManager.primaryColor
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$d',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isToday || isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected
                          ? Colors.white
                          : isWeekend
                          ? ColorManager.primaryColor
                          : Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          );
          day++;
        }
      }

      weeks.add(
        Row(
          children: [
            // Week number
            SizedBox(
              width: 30,
              child: Center(
                child: Text(
                  '$weekNumber',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ),
            ),
            ...weekDays,
          ],
        ),
      );
      weekNumber++;
    }

    return Column(children: weeks);
  }

  int _weekNumber(DateTime date) {
    final dayOfYear = date.difference(DateTime(date.year, 1, 1)).inDays + 1;
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
