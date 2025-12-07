import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/models/todo_task.dart';
import '../../providers/search_providers.dart';
import 'task_detail_page.dart';

/// Page for searching tasks
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Auto-focus search field when page opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider);
    final searchResultsAsync = ref.watch(searchResultsProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Search',
          style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
        ),
      ),
      body: Column(
        children: [
          // Search bar
          _buildSearchBar(),

          // Filter chips (optional)
          _buildFilterChips(),

          // Search results
          Expanded(
            child: searchQuery.isEmpty
                ? _buildEmptyState()
                : _buildSearchResults(searchResultsAsync, screenWidth),
          ),
        ],
      ),
    );
  }

  /// Builds the search input field
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.surface,
      child: TextField(
        controller: _searchController,
        focusNode: _focusNode,
        style: AppTypography.body1.copyWith(color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: 'Search tasks...',
          hintStyle: AppTypography.body1.copyWith(color: AppColors.textHint),
          prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: AppColors.textSecondary),
                  onPressed: () {
                    _searchController.clear();
                    ref.read(searchQueryProvider.notifier).state = '';
                  },
                )
              : null,
          filled: true,
          fillColor: AppColors.background,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.glassBorder, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.glassBorder, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primary, width: 2),
          ),
        ),
        onChanged: (value) {
          ref.read(searchQueryProvider.notifier).state = value;
        },
      ),
    );
  }

  /// Builds filter chips for refining search
  Widget _buildFilterChips() {
    final selectedFilters = ref.watch(searchFiltersProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: AppColors.surface,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip(
              label: 'All',
              isSelected: selectedFilters.isEmpty,
              onTap: () {
                ref.read(searchFiltersProvider.notifier).state = {};
              },
            ),
            const SizedBox(width: 8),
            _buildFilterChip(
              label: 'In Progress',
              isSelected: selectedFilters.contains('in_progress'),
              onTap: () {
                ref.read(searchFiltersProvider.notifier).update((state) {
                  final newState = Set<String>.from(state);
                  if (newState.contains('in_progress')) {
                    newState.remove('in_progress');
                  } else {
                    newState.add('in_progress');
                  }
                  return newState;
                });
              },
            ),
            const SizedBox(width: 8),
            _buildFilterChip(
              label: 'Completed',
              isSelected: selectedFilters.contains('completed'),
              onTap: () {
                ref.read(searchFiltersProvider.notifier).update((state) {
                  final newState = Set<String>.from(state);
                  if (newState.contains('completed')) {
                    newState.remove('completed');
                  } else {
                    newState.add('completed');
                  }
                  return newState;
                });
              },
            ),
            const SizedBox(width: 8),
            _buildFilterChip(
              label: 'High Priority',
              isSelected: selectedFilters.contains('high_priority'),
              onTap: () {
                ref.read(searchFiltersProvider.notifier).update((state) {
                  final newState = Set<String>.from(state);
                  if (newState.contains('high_priority')) {
                    newState.remove('high_priority');
                  } else {
                    newState.add('high_priority');
                  }
                  return newState;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a single filter chip
  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          label,
          style: AppTypography.caption.copyWith(
            color: isSelected ? Colors.white : AppColors.primary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  /// Builds the empty state when no search query is entered
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: AppColors.textHint),
          const SizedBox(height: 16),
          Text(
            'Search your tasks',
            style: AppTypography.h3.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            'Enter a keyword to find tasks',
            style: AppTypography.body2.copyWith(color: AppColors.textHint),
          ),
        ],
      ),
    );
  }

  /// Builds the search results list
  Widget _buildSearchResults(
    AsyncValue<List<TodoTask>> searchResultsAsync,
    double screenWidth,
  ) {
    return searchResultsAsync.when(
      data: (tasks) {
        if (tasks.isEmpty) {
          return _buildNoResults();
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _buildTaskCard(task),
            );
          },
        );
      },
      loading: () =>
          Center(child: CircularProgressIndicator(color: AppColors.primary)),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: AppColors.error),
            const SizedBox(height: 16),
            Text(
              'Error loading results',
              style: AppTypography.h3.copyWith(color: AppColors.error),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: AppTypography.body2.copyWith(color: AppColors.textHint),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the no results state
  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 64, color: AppColors.textHint),
          const SizedBox(height: 16),
          Text(
            'No results found',
            style: AppTypography.h3.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            'Try a different search term',
            style: AppTypography.body2.copyWith(color: AppColors.textHint),
          ),
        ],
      ),
    );
  }

  /// Builds a task card for search results
  Widget _buildTaskCard(TodoTask task) {
    return InkWell(
      onTap: () => _navigateToTaskDetail(task.id),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.glassBorder.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task title
            Text(
              task.title,
              style: AppTypography.body1.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (task.description != null && task.description!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                task.description!,
                style: AppTypography.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: 8),
            // Task metadata
            Row(
              children: [
                _buildMetadataChip(
                  icon: Icons.flag,
                  label: task.importance,
                  color: _getImportanceColor(task.importance),
                ),
                const SizedBox(width: 8),
                _buildMetadataChip(
                  icon: Icons.circle,
                  label: task.status,
                  color: _getStatusColor(task.status),
                ),
                if (task.dueDate != null) ...[
                  const SizedBox(width: 8),
                  _buildMetadataChip(
                    icon: Icons.calendar_today,
                    label: _formatDate(task.dueDate!),
                    color: AppColors.textSecondary,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a metadata chip for task cards
  Widget _buildMetadataChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTypography.caption.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// Gets color for importance level
  Color _getImportanceColor(String importance) {
    switch (importance.toLowerCase()) {
      case 'critical':
        return AppColors.error;
      case 'high':
        return AppColors.purple5;
      case 'medium':
        return AppColors.primary;
      case 'low':
        return AppColors.purple4;
      default:
        return AppColors.textSecondary;
    }
  }

  /// Gets color for task status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'notstared':
        return AppColors.textSecondary;
      case 'inprogress':
        return AppColors.primary;
      case 'onhold':
        return AppColors.purple6;
      case 'completed':
        return AppColors.purple4;
      default:
        return AppColors.textSecondary;
    }
  }

  /// Formats date for display
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final taskDate = DateTime(date.year, date.month, date.day);

    final difference = taskDate.difference(today).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference == -1) {
      return 'Yesterday';
    } else if (difference > 0 && difference < 7) {
      return 'in $difference days';
    } else if (difference < 0 && difference > -7) {
      return '${-difference} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  /// Navigate to task detail page
  Future<void> _navigateToTaskDetail(int taskId) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskDetailPage(taskId: taskId)),
    );
  }
}
