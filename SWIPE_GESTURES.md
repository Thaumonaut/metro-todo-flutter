# Swipe Gesture Feature

## Overview
The FluentCard widget now supports swipe gestures that reveal action buttons underneath the card, similar to email apps like Gmail or Apple Mail.

## Activation Required (Prevents Accidental Swipes)
To prevent accidental swipes while scrolling between sections, swipe gestures must be **activated first**:

### Touch Devices
1. **Press and hold** on the card
2. Wait 0.5 seconds until you see a subtle blue glow (gate unlocked)
3. **While still holding**, swipe left or right
4. Release to complete the action
5. To swipe again, you must hold again - the gate resets on release

The hold acts as a gate to prevent accidental swipes while scrolling. Once you release, you must hold again to unlock swiping.

### Desktop/Mouse
1. **Hover** over the card
2. Wait 0.5 seconds until you see a subtle blue glow
3. **While still hovering**, click and drag left or right
4. The swipe remains active as long as the mouse is over the card

## How It Works

### Swipe Directions
- **Swipe Right (left to right)**: Reveals the "Complete" action (green/purple background)
- **Swipe Left (right to left)**: Reveals the "Delete" action (red background)

### Usage in FluentCard

The `FluentCard` widget accepts the following swipe-related parameters:

```dart
FluentCard(
  child: YourContent(),

  // Swipe callbacks
  onSwipeLeft: () {
    // Called when user swipes left (right to left)
    // Typically used for delete action
  },
  onSwipeRight: () {
    // Called when user swipes right (left to right)
    // Typically used for complete/archive action
  },

  // Customization (optional)
  swipeLeftLabel: 'Delete',
  swipeLeftIcon: Icons.delete,
  swipeLeftColor: AppColors.error,

  swipeRightLabel: 'Complete',
  swipeRightIcon: Icons.check_circle,
  swipeRightColor: AppColors.purple4,
)
```

## Example: TaskSummaryCard

The `TaskSummaryCard` widget demonstrates how to use swipe gestures:

```dart
TaskSummaryCard(
  task: task,
  onTap: () => navigateToDetail(task),
  onComplete: () => completeTask(task),
  onDelete: () => deleteTask(task),
  enableSwipeActions: true,  // Enable/disable swipe gestures
)
```

## Implementation in Task Lists

The `TaskListSection` widget passes swipe handlers to task cards:

```dart
TaskListSection(
  title: 'All Tasks',
  tasksAsync: allTasksAsync,
  onTaskTap: (task) => navigateToTaskDetail(task.id),
  onTaskComplete: (task) => completeTask(task),
  onTaskDelete: (task) => deleteTask(task),
  enableSwipeActions: true,  // Control swipe gestures for all cards
)
```

## Customization

### Swipe Threshold
The swipe action triggers when:
- User drags more than 80px (threshold)
- OR user swipes with velocity > 500px/s

You can modify these values in `_FluentCardState`:
```dart
static const double _swipeThreshold = 80.0;
static const double _maxSwipeExtent = 120.0;
```

### Activation Delay
Control how long the user must hover/press before swipe is enabled:
```dart
static const Duration _activationDelay = Duration(milliseconds: 500);
```

### Colors and Icons
Customize the appearance of swipe actions using parameters:
- `swipeLeftColor` / `swipeRightColor` - Background color
- `swipeLeftIcon` / `swipeRightIcon` - Icon to display
- `swipeLeftLabel` / `swipeRightLabel` - Text label below icon

### Animation
The swipe animation uses:
- Duration: 250ms
- Curve: `Curves.easeOut`

## Features

1. **Accidental Swipe Prevention**: Requires long press (touch) or hover (mouse) before swiping
2. **Gate System**: Hold unlocks swiping, release locks it again - prevents all accidental swipes
3. **Hold-to-Swipe**: On touch devices, you must swipe while holding the gate open
4. **Visual Feedback**: Card shows a subtle blue glow when the gate is unlocked
5. **Smooth Animations**: Card slides smoothly to reveal actions
6. **Velocity Detection**: Fast swipes trigger actions even with small drag distance
7. **Auto-Reset**: Card returns to original position after action completes
8. **Opacity Transitions**: Action buttons fade in/out based on swipe direction
9. **Directional Control**: Only swipes with defined handlers are allowed
10. **Tap Still Works**: Regular onTap callback still functions normally

## Notes

- Swipe actions are **optional** - only provide callbacks for actions you want to enable
- If both `onSwipeLeft` and `onSwipeRight` are null, the card behaves like a normal FluentCard
- The swipe gesture doesn't interfere with vertical scrolling in lists
- Each swipe direction can be independently enabled/disabled
