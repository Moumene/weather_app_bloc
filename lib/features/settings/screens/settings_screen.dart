import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_theme.dart';
import '../../../domain/models/location/location_model.dart';
import '../../../domain/repositories/weather_repository.dart';
import '../../home/screens/home_shell_scope.dart';
import '../../location_search/bloc/location_search_bloc.dart';
import '../../weather/bloc/weather_bloc.dart';
import '../bloc/settings_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SettingsBloc>().add(const SettingsLoadRequested());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationSearchBloc(
            weatherRepository: context.read<WeatherRepository>(),
          ),
        ),
      ],
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is! SettingsLoaded) {
            return Container(
              color: AppColors.backgroundDark,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          }
          return _buildContent(context, state);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, SettingsLoaded state) {
    return Container(
      color: AppColors.backgroundDark,
      child: SafeArea(
        child: Column(
          children: [
            // Header (Stitch style)
            Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              decoration: BoxDecoration(
                color: AppColors.backgroundDark.withValues(alpha: 0.8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          HomeShellScope.of(context)?.onSwitchToTab(0);
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Weather Settings',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for a city or airport',
                      hintStyle: GoogleFonts.inter(color: Colors.white54),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white54,
                      ),
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.08),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: GoogleFonts.inter(color: Colors.white),
                    onChanged: (value) {
                      context.read<LocationSearchBloc>().add(
                        LocationSearchQueryChanged(query: value),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Search results or Saved Locations
                    BlocBuilder<LocationSearchBloc, LocationSearchState>(
                      builder: (context, searchState) {
                        return switch (searchState) {
                          LocationSearchLoading() => const Padding(
                            padding: EdgeInsets.all(24),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          LocationSearchLoaded(:final locations) =>
                            locations.isEmpty
                                ? _buildSavedLocationsPlaceholder(context)
                                : _LocationList(
                                    locations: locations,
                                    onSelect: (loc) =>
                                        _selectLocation(context, loc),
                                  ),
                          _ => _buildSavedLocationsPlaceholder(context),
                        };
                      },
                    ),
                    const SizedBox(height: 32),
                    // Settings section
                    Text(
                      'SETTINGS',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _SettingsCard(
                      children: [
                        _SettingsRow(
                          icon: Icons.thermostat,
                          label: 'Temperature Unit',
                          child: _UnitToggle(
                            useCelsius: state.useCelsius,
                            onChanged: (useCelsius) {
                              context.read<SettingsBloc>().add(
                                SettingsUnitChanged(useCelsius: useCelsius),
                              );
                              context.read<WeatherBloc>().add(
                                WeatherUnitsChanged(useCelsius: useCelsius),
                              );
                            },
                          ),
                        ),
                        _SettingsDivider(),
                        _SettingsRow(
                          icon: Icons.notifications_outlined,
                          label: 'Severe Weather Alerts',
                          child: Switch(
                            value: true,
                            onChanged: (_) {},
                            activeTrackColor: AppColors.primary,
                          ),
                        ),
                        _SettingsDivider(),
                        _SettingsRow(
                          icon: Icons.event_note_outlined,
                          label: 'Daily Summary',
                          child: Switch(
                            value: false,
                            onChanged: (_) {},
                            activeTrackColor: AppColors.primary,
                          ),
                        ),
                        _SettingsDivider(),
                        _SettingsRow(
                          icon: Icons.language,
                          label: 'Language',
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _languageName(state.languageCode),
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.white54,
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.white54,
                              ),
                            ],
                          ),
                          onTap: () => _showLanguageSheet(context, state),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'LEGAL',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _SettingsCard(
                      children: [
                        _SettingsRow(
                          label: 'Privacy Policy',
                          trailing: const Icon(
                            Icons.open_in_new,
                            color: Colors.white54,
                            size: 20,
                          ),
                        ),
                        _SettingsDivider(),
                        _SettingsRow(
                          label: 'Terms of Service',
                          trailing: const Icon(
                            Icons.open_in_new,
                            color: Colors.white54,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Version 1.0.0 (1)',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white54,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedLocationsPlaceholder(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, weatherState) {
        if (weatherState is WeatherLoaded) {
          return _SavedLocationCard(
            cityName: weatherState.weather.cityName,
            temp: weatherState.weather.temperature.round(),
            condition: weatherState.weather.description,
            useCelsius: weatherState.useCelsius,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _selectLocation(BuildContext context, LocationModel loc) {
    context.read<WeatherBloc>().add(
      WeatherLocationSelected(
        lat: loc.lat,
        lon: loc.lon,
        cityName: loc.name,
        countryCode: loc.country,
      ),
    );
    HomeShellScope.of(context)?.onSwitchToTab(0);
  }

  void _showLanguageSheet(BuildContext context, SettingsLoaded state) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.backgroundDark,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['en', 'fr', 'es', 'it'].map((code) {
            final name = _languageName(code);
            return ListTile(
              title: Text(name, style: GoogleFonts.inter(color: Colors.white)),
              trailing: state.languageCode == code
                  ? const Icon(Icons.check, color: AppColors.primary)
                  : null,
              onTap: () {
                context.read<SettingsBloc>().add(
                  SettingsLanguageChanged(languageCode: code),
                );
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  String _languageName(String code) {
    const names = {
      'en': 'English',
      'fr': 'Français',
      'es': 'Español',
      'it': 'Italiano',
    };
    return names[code] ?? code;
  }
}

class _SavedLocationCard extends StatelessWidget {
  const _SavedLocationCard({
    required this.cityName,
    required this.temp,
    required this.condition,
    required this.useCelsius,
  });

  final String cityName;
  final int temp;
  final String condition;
  final bool useCelsius;

  @override
  Widget build(BuildContext context) {
    final tempStr = useCelsius ? '$temp°C' : '${(temp * 9 / 5 + 32).round()}°F';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SAVED LOCATIONS',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cityName,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$tempStr · $condition',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 64,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                tempStr,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(children: children),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({
    this.icon,
    required this.label,
    this.child,
    this.trailing,
    this.onTap,
  });

  final IconData? icon;
  final String label;
  final Widget? child;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.primary, size: 24),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            ?child,
            ?trailing,
          ],
        ),
      ),
    );
  }
}

class _SettingsDivider extends StatelessWidget {
  const _SettingsDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: Colors.white.withValues(alpha: 0.1),
      indent: 52,
    );
  }
}

class _UnitToggle extends StatelessWidget {
  const _UnitToggle({required this.useCelsius, required this.onChanged});

  final bool useCelsius;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _UnitButton(
            label: '°C',
            isSelected: useCelsius,
            onTap: () => onChanged(true),
          ),
          _UnitButton(
            label: '°F',
            isSelected: !useCelsius,
            onTap: () => onChanged(false),
          ),
        ],
      ),
    );
  }
}

class _UnitButton extends StatelessWidget {
  const _UnitButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black26, blurRadius: 2)]
              : null,
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.white70,
          ),
        ),
      ),
    );
  }
}

class _LocationList extends StatelessWidget {
  const _LocationList({required this.locations, required this.onSelect});

  final List<LocationModel> locations;
  final void Function(LocationModel) onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SEARCH RESULTS',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        ...locations.map(
          (loc) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Material(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: () => onSelect(loc),
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: AppColors.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              loc.name,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              loc.country,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Colors.white54),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
