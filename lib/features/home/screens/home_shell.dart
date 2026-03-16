import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../l10n/app_localizations.dart';
import '../../settings/screens/settings_screen.dart';
import '../../weather/screens/weather_dashboard_screen.dart';
import 'home_shell_scope.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  void _switchToSettings() {
    setState(() => _currentIndex = 2);
  }

  void _switchToTab(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return HomeShellScope(
      onSwitchToSettings: _switchToSettings,
      onSwitchToTab: _switchToTab,
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            WeatherDashboardScreen(),
            WeatherDashboardScreen(), // Forecast could be separate; reuse for now
            SettingsScreen(),
          ],
        ),
        bottomNavigationBar: _currentIndex == 2
            ? _SettingsNavBar(
                currentIndex: _currentIndex,
                onTab: (i) => setState(() => _currentIndex = i),
                l10n: l10n,
              )
            : _MainScreenNavBar(
                currentPage: _currentIndex,
                onListTap: () => setState(() => _currentIndex = 2),
                onPageChange: (i) => setState(() => _currentIndex = i),
                onLocationTap: () => setState(() => _currentIndex = 2),
              ),
      ),
    );
  }
}

/// Main screen nav: list (left) | page dots (center) | location (right)
class _MainScreenNavBar extends StatelessWidget {
  const _MainScreenNavBar({
    required this.currentPage,
    required this.onListTap,
    required this.onPageChange,
    required this.onLocationTap,
  });

  final int currentPage;
  final VoidCallback onListTap;
  final void Function(int) onPageChange;
  final VoidCallback onLocationTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: onListTap,
                    icon: const Icon(Icons.list),
                    color: AppColors.primary,
                    iconSize: 28,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(3, (i) {
                      final isActive = i == currentPage;
                      return GestureDetector(
                        onTap: () => onPageChange(i),
                        child: Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isActive
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                      );
                    }),
                  ),
                  IconButton(
                    onPressed: onLocationTap,
                    icon: const Icon(Icons.near_me),
                    color: Colors.white,
                    iconSize: 28,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Settings screen nav: Weather | Forecast | Settings tabs
class _SettingsNavBar extends StatelessWidget {
  const _SettingsNavBar({
    required this.currentIndex,
    required this.onTab,
    required this.l10n,
  });

  final int currentIndex;
  final void Function(int) onTab;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavItem(
                icon: Icons.cloud_outlined,
                label: l10n.appTitle,
                isSelected: currentIndex == 0,
                onTap: () => onTab(0),
              ),
              _NavItem(
                icon: Icons.calendar_month_outlined,
                label: l10n.forecast,
                isSelected: currentIndex == 1,
                onTap: () => onTab(1),
              ),
              _NavItem(
                icon: Icons.settings,
                label: l10n.settings,
                isSelected: currentIndex == 2,
                onTap: () => onTab(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected ? AppColors.primary : Colors.white54,
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: isSelected ? AppColors.primary : Colors.white54,
            ),
          ),
        ],
      ),
    );
  }
}
