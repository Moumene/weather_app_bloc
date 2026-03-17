import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/errors/weather_failure.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/forecast_utils.dart';
import '../../../domain/models/daily_forecast/daily_forecast_model.dart';
import '../../../domain/models/forcast/forecast_model.dart';
import '../../../domain/models/weather/weather_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../home/screens/home_shell_scope.dart';
import '../bloc/weather_bloc.dart';

class WeatherDashboardScreen extends StatelessWidget {
  const WeatherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return switch (state) {
          WeatherInitial() => _buildInitialView(context),
          WeatherLoading() => _buildLoadingView(context),
          WeatherLoaded(:final weather, :final forecast, :final useCelsius) =>
            _buildDashboard(context, weather, forecast, useCelsius),
          WeatherError(:final failure) => _buildErrorView(context, failure),
        };
      },
    );
  }

  Widget _buildInitialView(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E88E5),
            AppColors.primary,
            AppColors.backgroundDark,
          ],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_outlined,
                  size: 80,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.appTitle,
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.searchLocation,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 32),
                FilledButton.icon(
                  onPressed: () => _openSettings(context),
                  icon: const Icon(Icons.search),
                  label: Text(l10n.searchLocation),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingView(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E88E5),
            AppColors.primary,
            AppColors.backgroundDark,
          ],
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }

  Widget _buildDashboard(
    BuildContext context,
    WeatherModel weather,
    List<ForecastModel> forecast,
    bool useCelsius,
  ) {
    final temp = _formatTemp(weather.temperature, useCelsius);
    final dailyForecast = groupForecastByDay(forecast);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.backgroundDark,
            AppColors.backgroundDarker,
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            // Header / Current Weather (Stitch style with illustrations)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: RadialGradient(
                      center: Alignment(0, -0.8),
                      radius: 1.2,
                      colors: [
                        _illustrationGradientColor(weather.iconCode),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.6],
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      _WeatherIllustration(iconCode: weather.iconCode),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            Text(
                              weather.cityName,
                              style: GoogleFonts.inter(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              temp,
                              style: GoogleFonts.inter(
                                fontSize: 64,
                                fontWeight: FontWeight.w200,
                                letterSpacing: -2,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              weather.description,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'H:${_formatTemp(weather.temperature + 3, useCelsius)}',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'L:${_formatTemp(weather.temperature - 5, useCelsius)}',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Hourly Forecast
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.schedule, size: 16, color: Colors.white70),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context)!.hourlyForecast,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: forecast.length,
                          itemBuilder: (context, index) {
                            final f = forecast[index];
                            return _HourlyItem(
                              forecast: f,
                              useCelsius: useCelsius,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // 10-Day Forecast
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context)!.tenDayForecast,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ...dailyForecast.map(
                        (d) => _DailyRow(daily: d, useCelsius: useCelsius),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // Details Grid
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    _UVIndexCard(uvIndex: 2),
                    _DetailCard(
                      icon: Icons.wb_twilight,
                      title: AppLocalizations.of(context)!.sunset,
                      value: _formatTime(weather.sunset),
                    ),
                    _WindCard(
                      windSpeed: weather.windSpeed,
                      windDeg: weather.windDeg,
                    ),
                    _HumidityCard(
                      humidity: weather.humidity,
                      temperature: weather.temperature,
                      useCelsius: useCelsius,
                    ),
                    _VisibilityCard(visibilityMeters: weather.visibility ?? 0),
                    _PressureCard(
                      pressure: weather.pressure,
                      trend: _PressureTrend.falling,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Data provided by OpenWeatherMap',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(fontSize: 12, color: Colors.white54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, WeatherFailure failure) {
    final l10n = AppLocalizations.of(context)!;
    String message = l10n.error;
    if (failure is WeatherFailureLocationPermission) {
      message = l10n.permissionDenied;
    } else if (failure is WeatherFailureLocationDisabled) {
      message = l10n.locationDisabled;
    } else if (failure is WeatherFailureNotFound) {
      message = l10n.noResults;
    } else {
      message = failure.props.firstOrNull?.toString() ?? l10n.error;
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E88E5),
            AppColors.primary,
            AppColors.backgroundDark,
          ],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
                const SizedBox(height: 24),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 32),
                FilledButton.icon(
                  onPressed: () => _openSettings(context),
                  icon: const Icon(Icons.search),
                  label: Text(l10n.searchLocation),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => context.read<WeatherBloc>().add(
                    const WeatherLoadRequested(),
                  ),
                  child: Text(
                    l10n.retry,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatTemp(double celsius, bool useCelsius) {
    if (useCelsius) return '${celsius.round()}°';
    final f = celsius * 9 / 5 + 32;
    return '${f.round()}°';
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  void _openSettings(BuildContext context) {
    HomeShellScope.of(context)?.onSwitchToSettings();
  }

  static Color _illustrationGradientColor(String iconCode) {
    if (iconCode.startsWith('01') || iconCode.startsWith('02')) {
      return const Color(0xFFFDE047).withValues(alpha: 0.15);
    }
    if (iconCode.startsWith('09') || iconCode.startsWith('10')) {
      return const Color(0xFF64B5F6).withValues(alpha: 0.12);
    }
    return Colors.white.withValues(alpha: 0.08);
  }
}

/// Stitch-style atmospheric illustrations: sun glow, clouds (blurred shapes)
class _WeatherIllustration extends StatelessWidget {
  const _WeatherIllustration({required this.iconCode});

  final String iconCode;

  @override
  Widget build(BuildContext context) {
    final isSunny = iconCode.startsWith('01') || iconCode.startsWith('02');
    final isCloudy = iconCode.startsWith('03') || iconCode.startsWith('04');
    final isRainy = iconCode.startsWith('09') || iconCode.startsWith('10');

    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Sun glow (top right) - for clear/partly cloudy
            if (isSunny)
              Positioned(
                top: -20,
                right: 20,
                child: _BlurredGlow(
                  size: 150,
                  color: const Color(0xFFFDE047).withValues(alpha: 0.3),
                  blur: 20,
                ),
              ),
            // Cloud 1 (top left)
            if (isSunny || isCloudy)
              Positioned(
                top: 40,
                left: -20,
                child: _BlurredCloud(width: 120, height: 40, blur: 15),
              ),
            // Cloud 2 (bottom right)
            if (isSunny || isCloudy)
              Positioned(
                bottom: 60,
                right: -30,
                child: _BlurredCloud(width: 160, height: 50, blur: 20),
              ),
            // Rain atmosphere - softer clouds
            if (isRainy) ...[
              Positioned(
                top: 30,
                left: -10,
                child: _BlurredCloud(
                  width: 100,
                  height: 35,
                  blur: 18,
                  opacity: 0.06,
                ),
              ),
              Positioned(
                bottom: 80,
                right: -20,
                child: _BlurredCloud(
                  width: 140,
                  height: 45,
                  blur: 22,
                  opacity: 0.05,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _BlurredGlow extends StatelessWidget {
  const _BlurredGlow({required this.size, required this.color, this.blur = 20});

  final double size;
  final Color color;
  final double blur;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color, Colors.transparent],
            stops: const [0.0, 0.7],
          ),
        ),
      ),
    );
  }
}

class _BlurredCloud extends StatelessWidget {
  const _BlurredCloud({
    required this.width,
    required this.height,
    this.blur = 15,
    this.opacity = 0.1,
  });

  final double width;
  final double height;
  final double blur;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: opacity),
          borderRadius: BorderRadius.circular(height / 2),
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  const _GlassCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _HourlyItem extends StatelessWidget {
  const _HourlyItem({required this.forecast, required this.useCelsius});

  final ForecastModel forecast;
  final bool useCelsius;

  @override
  Widget build(BuildContext context) {
    final temp = useCelsius
        ? '${forecast.temperature.round()}°'
        : '${(forecast.temperature * 9 / 5 + 32).round()}°';
    final time = forecast.dateTime.hour == 0
        ? 'Now'
        : '${forecast.dateTime.hour} ${forecast.dateTime.hour < 12 ? 'AM' : 'PM'}';

    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        children: [
          Text(
            time,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Icon(
            _iconForCode(forecast.iconCode),
            color: AppColors.primary,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            temp,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForCode(String code) {
    if (code.startsWith('01')) return Icons.wb_sunny;
    if (code.startsWith('02')) return Icons.wb_cloudy;
    if (code.startsWith('03') || code.startsWith('04')) return Icons.cloud;
    if (code.startsWith('09') || code.startsWith('10')) return Icons.grain;
    if (code.startsWith('11')) return Icons.flash_on;
    if (code.startsWith('13')) return Icons.ac_unit;
    if (code.startsWith('50')) return Icons.cloud;
    return Icons.wb_sunny;
  }
}

class _DailyRow extends StatelessWidget {
  const _DailyRow({required this.daily, required this.useCelsius});

  final DailyForecastModel daily;
  final bool useCelsius;

  @override
  Widget build(BuildContext context) {
    final min = useCelsius
        ? daily.minTemp.round()
        : (daily.minTemp * 9 / 5 + 32).round();
    final max = useCelsius
        ? daily.maxTemp.round()
        : (daily.maxTemp * 9 / 5 + 32).round();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              daily.dayName,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Icon(
            _iconForCode(daily.iconCode),
            color: AppColors.primary,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              children: [
                Text(
                  '$min°',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _TempBar(min: min, max: max),
                ),
                const SizedBox(width: 12),
                Text(
                  '$max°',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForCode(String code) {
    if (code.startsWith('01')) return Icons.wb_sunny;
    if (code.startsWith('02')) return Icons.cloud_queue;
    if (code.startsWith('03') || code.startsWith('04')) return Icons.cloud;
    if (code.startsWith('09') || code.startsWith('10')) return Icons.grain;
    return Icons.wb_sunny;
  }
}

class _TempBar extends StatelessWidget {
  const _TempBar({required this.min, required this.max});

  final int min;
  final int max;

  @override
  Widget build(BuildContext context) {
    final range = (max - min).clamp(1, 30);
    final widthFactor = (range / 30 * 0.5 + 0.3).clamp(0.3, 0.8);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 4,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: widthFactor,
            child: Container(
              height: 4,
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFF176), AppColors.primary],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _UVIndexCard extends StatelessWidget {
  const _UVIndexCard({this.uvIndex = 2});

  final double uvIndex;

  static const _maxUv = 11.0;

  String get _description {
    if (uvIndex <= 2) return 'Low';
    if (uvIndex <= 5) return 'Moderate';
    if (uvIndex <= 7) return 'High';
    if (uvIndex <= 10) return 'Very High';
    return 'Extreme';
  }

  String get _advice {
    if (uvIndex <= 2) return 'Use sun protection until 4 PM.';
    if (uvIndex <= 5) return 'Wear sunscreen and seek shade at midday.';
    if (uvIndex <= 7) return 'Protection required. Limit sun exposure.';
    if (uvIndex <= 10) return 'Extra protection needed. Avoid midday sun.';
    return 'Avoid sun exposure. Stay indoors if possible.';
  }

  @override
  Widget build(BuildContext context) {
    final progress = (uvIndex / _maxUv).clamp(0.0, 1.0);

    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.wb_sunny_outlined, size: 16, color: Colors.white70),
              const SizedBox(width: 8),
              Text(
                'UV INDEX',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Text(
            uvIndex.toStringAsFixed(uvIndex == uvIndex.roundToDouble() ? 0 : 1),
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            _description,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, constraints) {
              final barWidth = constraints.maxWidth;
              final fillWidth = barWidth * progress;
              return ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: 6,
                  child: Stack(
                    children: [
                      Container(
                        width: barWidth,
                        color: Colors.grey.withValues(alpha: 0.4),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        width: fillWidth,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF4CAF50),
                                const Color(0xFF8BC34A),
                                const Color(0xFFFFEB3B),
                                const Color(0xFFFF9800),
                                const Color(0xFFF44336),
                                const Color(0xFF9C27B0),
                              ],
                              stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: (fillWidth - 2).clamp(0.0, barWidth - 4),
                        top: 0,
                        child: Container(
                          width: 4,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 6),
          Text(
            _advice,
            style: GoogleFonts.inter(fontSize: 10, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

enum _PressureTrend { rising, falling, steady }

class _VisibilityCard extends StatelessWidget {
  const _VisibilityCard({required this.visibilityMeters});

  final int visibilityMeters;

  String get _description {
    final km = visibilityMeters / 1000;
    if (km >= 10) return "It's perfectly clear.";
    if (km >= 5) return 'Good visibility.';
    if (km >= 1) return 'Moderate visibility.';
    if (km >= 0.5) return 'Poor visibility.';
    return 'Very poor visibility.';
  }

  @override
  Widget build(BuildContext context) {
    final km = visibilityMeters / 1000;
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.visibility_outlined, size: 16, color: Colors.white70),
              const SizedBox(width: 8),
              Text(
                'VISIBILITY',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Text(
            km >= 1
                ? '${km == km.roundToDouble() ? km.toInt() : km.toStringAsFixed(1)} km'
                : '$visibilityMeters m',
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            _description,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

String _windDirectionLabel(int? deg) {
  if (deg == null) return 'N';
  const labels = [
    'N',
    'NNE',
    'NE',
    'ENE',
    'E',
    'ESE',
    'SE',
    'SSE',
    'S',
    'SSW',
    'SW',
    'WSW',
    'W',
    'WNW',
    'NW',
    'NNW',
  ];
  final index = ((deg / 22.5) + 0.5).floor() % 16;
  return labels[index];
}

double _dewPointCelsius(double tempCelsius, int humidity) {
  if (humidity <= 0) return tempCelsius;
  return tempCelsius - (100 - humidity) / 5;
}

class _WindCard extends StatelessWidget {
  const _WindCard({required this.windSpeed, this.windDeg});

  final double windSpeed;
  final int? windDeg;

  @override
  Widget build(BuildContext context) {
    final direction = _windDirectionLabel(windDeg);
    final deg = windDeg ?? 0;
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.air, size: 16, color: Colors.white70),
              const SizedBox(width: 8),
              Text(
                'WIND',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                windSpeed.toStringAsFixed(0),
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'km/h',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 44,
            height: 44,
            child: CustomPaint(
              painter: _WindDirectionPainter(deg: deg.toDouble()),
              child: Center(
                child: Text(
                  direction,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WindDirectionPainter extends CustomPainter {
  _WindDirectionPainter({required this.deg});

  final double deg;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2;

    final greyPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final bluePaint = Paint()
      ..color = const Color(0xFF258CF4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, greyPaint);

    const sweepDeg = 60.0;
    const startOffset = 30.0;
    final metDeg = deg % 360;
    final flutterStartDeg = 270 - metDeg - startOffset;
    final flutterStart = flutterStartDeg * math.pi / 180;
    final sweep = sweepDeg * math.pi / 180;
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, flutterStart, sweep, false, bluePaint);
  }

  @override
  bool shouldRepaint(covariant _WindDirectionPainter oldDelegate) =>
      oldDelegate.deg != deg;
}

class _HumidityCard extends StatelessWidget {
  const _HumidityCard({
    required this.humidity,
    required this.temperature,
    required this.useCelsius,
  });

  final int humidity;
  final double temperature;
  final bool useCelsius;

  @override
  Widget build(BuildContext context) {
    final dewPointC = _dewPointCelsius(temperature, humidity);
    final dewPointDisplay = useCelsius
        ? '${dewPointC.round()}°'
        : '${(dewPointC * 9 / 5 + 32).round()}°';

    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.water_drop_outlined, size: 16, color: Colors.white70),
              const SizedBox(width: 8),
              Text(
                'HUMIDITY',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Text(
            '$humidity%',
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            'The dew point is $dewPointDisplay right now.',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class _PressureCard extends StatelessWidget {
  const _PressureCard({
    required this.pressure,
    this.trend = _PressureTrend.steady,
  });

  final int pressure;
  final _PressureTrend trend;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.speed, size: 16, color: Colors.white70),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)!.pressure,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Text(
            '$pressure',
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF258CF4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  trend == _PressureTrend.rising
                      ? Icons.arrow_upward
                      : trend == _PressureTrend.falling
                      ? Icons.arrow_downward
                      : Icons.remove,
                  size: 14,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  trend == _PressureTrend.rising
                      ? AppLocalizations.of(context)!.rising
                      : trend == _PressureTrend.falling
                      ? AppLocalizations.of(context)!.falling
                      : AppLocalizations.of(context)!.steady,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.white70),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
