# Swipe Gestures - Quick Usage Guide

## How to Use Swipe Gestures on Task Cards

### Step 1: Activate Swipe Mode

#### On Touch Devices (Phone/Tablet)
```
1. Press and HOLD on a task card
2. Wait 0.5 seconds - you'll see a subtle blue glow appear (gate unlocked!)
3. While still holding, you can now swipe
4. Release after completing your swipe
5. To swipe again, hold again - the gate resets each time
```

#### On Desktop/Mouse
```
1. Hover your mouse over a task card
2. Wait 0.5 seconds - you'll see a subtle blue glow appear
3. The card is now ready to swipe
```

### Step 2: Perform the Swipe (While Still Holding/Hovering)

Once the card is glowing (swipe mode active):

#### Complete a Task
```
While still holding, swipe RIGHT (drag from left to right) →
- A purple/green background will appear
- Shows a checkmark icon with "Complete" label
- Release when you've swiped far enough
- Task will be marked as complete
```

#### Delete a Task
```
While still holding, swipe LEFT (drag from right to left) ←
- A red background will appear
- Shows a trash icon with "Delete" label
- Release when you've swiped far enough
- You'll see a confirmation dialog before deletion
```

**IMPORTANT**:
- You must swipe while still holding the card
- Once you release, the gate locks again
- To swipe again, you must hold for 0.5 seconds again
- This prevents accidental swipes when scrolling between views

### Visual Guide

```
Normal State:
┌─────────────────────────┐
│   Task: Buy groceries   │
│   Due: Today            │
└─────────────────────────┘

After Long Press/Hover (Swipe Mode Active):
┌─────────────────────────┐
│   Task: Buy groceries   │ ← Blue glow visible
│   Due: Today            │
└─────────────────────────┘

Swiping Right →
┌─────────────────────────┐
│ ✓  │ Task: Buy groceries│ ← Purple background revealed
│Complete│ Due: Today     │
└─────────────────────────┘

Swiping Left ←
┌─────────────────────────┐
│Task: Buy groceries │ 🗑  │ ← Red background revealed
│   Due: Today   │Delete  │
└─────────────────────────┘
```

## Tips

1. **Don't rush**: Wait for the blue glow before swiping
2. **Keep holding**: You must swipe while still holding the card (touch devices)
3. **Gate resets**: Each swipe requires a new hold - this is intentional to prevent accidents
4. **Swipe confidently**: A quick swipe gesture works best
5. **Prevent accidents**: The hold requirement prevents accidental swipes while scrolling
6. **Try different speeds**: Both slow drags and fast flicks work
7. **Threshold**: You need to swipe at least 80px or swipe fast (>500px/s) to trigger

## Troubleshooting

**Q: The card won't swipe**
- A: Make sure you see the blue glow first (wait 0.5 seconds)
- A: On touch devices, make sure you're still holding when you swipe

**Q: The glow disappears when I try to swipe**
- A: You released your hold. The gate locks immediately when you release.
- A: Keep holding while you swipe, then release to complete the action.

**Q: I accidentally triggered a swipe**
- A: The delete action has a confirmation dialog, so you can cancel it
- A: The hold requirement should prevent most accidental swipes

**Q: How do I cancel a swipe?**
- A: Just don't swipe far enough (less than 80px). The card will bounce back

**Q: The swipe feels too sensitive/not sensitive enough**
- A: The developer can adjust the thresholds in the code (see main documentation)

## Configuration for Developers

To adjust the activation time, modify in `fluent_card.dart`:
```dart
static const Duration _activationDelay = Duration(milliseconds: 500);
```

To adjust swipe sensitivity:
```dart
static const double _swipeThreshold = 80.0;  // Distance needed to trigger
static const double _maxSwipeExtent = 120.0; // Maximum swipe distance
```

**Gate Behavior**:
- The hold acts as a gate that unlocks swiping
- Once you release, the gate locks immediately
- You must hold again for 0.5 seconds to unlock swiping again
- This ensures you never accidentally swipe while scrolling between views
