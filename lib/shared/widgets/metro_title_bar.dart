import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class MetroTitleBar extends StatelessWidget {
  const MetroTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return WindowTitleBarBox(
      child: Container(
        color: Theme.of(
          context,
        ).scaffoldBackgroundColor, // Match app background
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanStart: (details) {
                  appWindow.startDragging();
                },
                onDoubleTap: () {
                  appWindow.maximizeOrRestore();
                },
                child: Container(
                  color: Colors.transparent, // Ensure hit test works
                  padding: const EdgeInsets.only(left: 12.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Metro Todo',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ),
            ),
            const ManualWindowButtons(),
          ],
        ),
      ),
    );
  }
}

class ManualWindowButtons extends StatelessWidget {
  const ManualWindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _WindowButton(
          icon: Icons.remove,
          onPressed: () => appWindow.minimize(),
        ),
        _WindowButton(
          icon: Icons.crop_square,
          onPressed: () => appWindow.maximizeOrRestore(),
        ),
        _WindowButton(
          icon: Icons.close,
          onPressed: () => appWindow.close(),
          isClose: true,
        ),
      ],
    );
  }
}

class _WindowButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isClose;

  const _WindowButton({
    required this.icon,
    required this.onPressed,
    this.isClose = false,
  });

  @override
  State<_WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<_WindowButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final hoverColor = widget.isClose
        ? Colors.red.shade700
        : colorScheme.onSurface.withValues(alpha: 0.2);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 46, // Standard Windows button width
          height: double.infinity, // Fill vertical
          color: _isHovered ? hoverColor : Colors.transparent,
          child: Icon(
            widget.icon,
            size: 16,
            color: widget.isClose && _isHovered
                ? Colors.white
                : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
