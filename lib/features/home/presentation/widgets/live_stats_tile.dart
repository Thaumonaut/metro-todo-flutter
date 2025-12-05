import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/providers/repository_providers.dart';

/// A live tile widget that displays task statistics in a gallery-style format
/// Features vertical scrolling with auto-cycling and user interaction controls
/// Pauses auto-cycling when the user hovers or touches the tile
class LiveStatsTile extends StatefulWidget {
  const LiveStatsTile({
    super.key,
    required this.stats,
  });

  final TodoStats stats;

  @override
  State<LiveStatsTile> createState() => _LiveStatsTileState();
}

class _LiveStatsTileState extends State<LiveStatsTile> {
  late PageController _pageController;
  int _currentIndex = 0;
  late List<_StatData> _statsList;
  bool _isHovered = false;
  bool _isUserInteracting = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _updateStatsList();
    _startAutoCycle();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Updates the stats list when widget data changes
  void _updateStatsList() {
    _statsList = [
      _StatData(
        value: '${widget.stats.total}',
        label: 'Total Tasks',
        icon: Icons.format_list_bulleted,
      ),
      _StatData(
        value: '${widget.stats.completed}',
        label: 'Completed',
        icon: Icons.check_circle,
      ),
      _StatData(
        value: '${widget.stats.dueToday}',
        label: 'Due Today',
        icon: Icons.today,
      ),
      _StatData(
        value: '${widget.stats.overdue}',
        label: 'Overdue',
        icon: Icons.warning,
      ),
    ];
  }

  void _startAutoCycle() {
    Future.delayed(const Duration(seconds: 30), () {
      if (!mounted || _isHovered || _isUserInteracting) {
        _startAutoCycle();
        return;
      }

      final nextIndex = (_currentIndex + 1) % _statsList.length;
      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
      _startAutoCycle();
    });
  }

  @override
  void didUpdateWidget(LiveStatsTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.stats != widget.stats) {
      _updateStatsList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onPanStart: (_) => setState(() => _isUserInteracting = true),
        onPanEnd: (_) {
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) setState(() => _isUserInteracting = false);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.purple6,
            borderRadius: BorderRadius.circular(4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemCount: _statsList.length,
              itemBuilder: (context, index) {
                final stat = _statsList[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Label and icon
                      Row(
                        children: [
                          Icon(
                            stat.icon,
                            size: 16,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              stat.label,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Value
                      Text(
                        stat.value,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -1.0,
                          height: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Data class for stat display
class _StatData {
  final String value;
  final String label;
  final IconData icon;

  _StatData({
    required this.value,
    required this.label,
    required this.icon,
  });
}
