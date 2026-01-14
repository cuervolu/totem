import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

class CalendarWidget extends StatelessWidget {
  final VoidCallback onClick;
  final double? height;

  const CalendarWidget({super.key, required this.onClick, this.height});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final monthName = _getSpanishMonth(now.month);

    // Eventos de ejemplo
    final upcomingEvents = [
      _EventData(day: '15', title: 'Reunión equipo', time: '10:00'),
      _EventData(day: '18', title: 'Dentista', time: '15:30'),
    ];

    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 28,
                  color: theme.colorScheme.onPrimary,
                ),
                const SizedBox(width: 12),
                Text(
                  monthName,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildWeekDays(theme),
            const SizedBox(height: 4),
            Expanded(
              child: MonthView(
                controller: EventController(),
                minMonth: DateTime(now.year, now.month, 1),
                maxMonth: DateTime(now.year, now.month + 1, 0),
                initialMonth: DateTime(now.year, now.month),
                cellAspectRatio: 1,
                borderSize: 0,
                showBorder: false,
                hideDaysNotInMonth: true,
                headerBuilder: (date) => const SizedBox.shrink(),
                cellBuilder:
                    (date, events, isToday, isInMonth, hideDaysNotInMonth) {
                      return _buildCalendarCell(
                        date,
                        isToday,
                        isInMonth,
                        events.isNotEmpty,
                        theme,
                      );
                    },
              ),
            ),
            const SizedBox(height: 12),
            ...upcomingEvents.map(
              (event) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: _buildEvent(event, theme),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekDays(ThemeData theme) {
    const days = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
    return Row(
      children: days.map((day) {
        return Expanded(
          child: Center(
            child: Text(
              day,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.6),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarCell(
    DateTime date,
    bool isToday,
    bool isInMonth,
    bool hasEvent,
    ThemeData theme,
  ) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: isToday
            ? theme.colorScheme.secondary
            : isInMonth
            ? theme.colorScheme.onPrimary.withValues(alpha: 0.15)
            : theme.colorScheme.onPrimary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date.day.toString(),
            style: theme.textTheme.labelMedium?.copyWith(
              color: !isInMonth
                  ? theme.colorScheme.onPrimary.withValues(alpha: 0.3)
                  : isToday
                  ? theme.colorScheme.onSecondary
                  : theme.colorScheme.onPrimary,
            ),
          ),
          if (hasEvent && isInMonth)
            Container(
              width: 4,
              height: 4,
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                color: isToday
                    ? theme.colorScheme.onSecondary
                    : theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEvent(_EventData event, ThemeData theme) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          child: Text(
            event.day,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontFamily: 'monospace',
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                event.time,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onPrimary.withValues(alpha: 0.7),
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getSpanishMonth(int month) {
    const months = [
      'ENERO',
      'FEBRERO',
      'MARZO',
      'ABRIL',
      'MAYO',
      'JUNIO',
      'JULIO',
      'AGOSTO',
      'SEPTIEMBRE',
      'OCTUBRE',
      'NOVIEMBRE',
      'DICIEMBRE',
    ];
    return months[month - 1];
  }
}

class _EventData {
  final String day;
  final String title;
  final String time;

  _EventData({required this.day, required this.title, required this.time});
}
