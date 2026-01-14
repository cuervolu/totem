import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:totem/core/utils/platform_utils.dart';
import 'package:totem/core/connectivity/connectivity_cubit.dart';
import 'package:totem/core/connectivity/connectivity_manager.dart';
import 'package:totem/features/home/presentation/widgets/sidebar.dart';
import 'package:totem/features/home/presentation/widgets/grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _connectivityManager = ConnectivityManager();

  @override
  void dispose() {
    _connectivityManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, bool>(
      listener: (context, isConnected) {
        _connectivityManager.handleConnectivityChange(isConnected, context);
      },
      child: Scaffold(
        appBar: isMobile ? AppBar(title: const Text('Totem')) : null,
        drawer: isMobile ? _buildDrawer(context) : null,
        body: isMobile
            ? HomeGridView(
                onCalendarClick: () => context.push('/calendar'),
                onWeatherClick: () => context.push('/weather'),
                onRssClick: () => context.push('/rss'),
              )
            : Row(
                children: [
                  const Expanded(flex: 3, child: Sidebar()),
                  Expanded(
                    flex: 7,
                    child: HomeGridView(
                      onCalendarClick: () => context.push('/calendar'),
                      onWeatherClick: () => context.push('/weather'),
                      onRssClick: () => context.push('/rss'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Totem')),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () => context.go('/'),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Calendario'),
            onTap: () => context.push('/calendar'),
          ),
          ListTile(
            leading: const Icon(Icons.cloud),
            title: const Text('Clima'),
            onTap: () => context.push('/weather'),
          ),
          ListTile(
            leading: const Icon(Icons.rss_feed),
            title: const Text('Noticias'),
            onTap: () => context.push('/rss'),
          ),
        ],
      ),
    );
  }
}
