import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totem/core/connectivity/connectivity_cubit.dart';
import 'package:totem/features/home/presentation/widgets/totem_mascot.dart';
import 'dart:async';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _currentTime = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TotemMascot(),
          const SizedBox(height: 32),
          _buildClock(theme),
          const SizedBox(height: 32),
          _buildSystemStatus(theme),
          const SizedBox(height: 16),
          _buildModeIndicator(theme),
        ],
      ),
    );
  }

  Widget _buildClock(ThemeData theme) {
    final hour = _currentTime.hour.toString().padLeft(2, '0');
    final minute = _currentTime.minute.toString().padLeft(2, '0');
    final weekday = _getSpanishWeekday(_currentTime.weekday);
    final day = _currentTime.day;
    final month = _getSpanishMonth(_currentTime.month);

    return Column(
      children: [
        Text(
          '$hour:$minute',
          style: theme.textTheme.displayLarge?.copyWith(
            fontFamily: 'monospace',
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '$weekday, $day $month',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildSystemStatus(ThemeData theme) {
    return BlocBuilder<ConnectivityCubit, bool>(
      builder: (context, isConnected) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isConnected ? Icons.wifi : Icons.wifi_off,
              size: 16,
              color: isConnected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.error,
            ),
            const SizedBox(width: 12),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildModeIndicator(ThemeData theme) {
    return Text(
      'VISTA GRID',
      style: theme.textTheme.labelSmall?.copyWith(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
      ),
    );
  }

  String _getSpanishWeekday(int weekday) {
    const days = ['LUN', 'MAR', 'MIÉ', 'JUE', 'VIE', 'SÁB', 'DOM'];
    return days[weekday - 1];
  }

  String _getSpanishMonth(int month) {
    const months = [
      'ENE',
      'FEB',
      'MAR',
      'ABR',
      'MAY',
      'JUN',
      'JUL',
      'AGO',
      'SEP',
      'OCT',
      'NOV',
      'DIC',
    ];
    return months[month - 1];
  }
}
