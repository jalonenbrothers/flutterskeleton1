import 'package:flutter/material.dart';

/// Avatar widget for displaying user profile pictures or initials
///
/// Shows an image if URL is provided, otherwise displays initials
/// with a colored background based on the name.
///
/// Example:
/// ```dart
/// AvatarWidget(
///   name: 'John Doe',
///   imageUrl: 'https://example.com/avatar.jpg',
///   radius: 24,
/// )
/// ```
class AvatarWidget extends StatelessWidget {
  /// User's name (used for initials)
  final String name;

  /// Optional image URL
  final String? imageUrl;

  /// Avatar radius
  final double radius;

  /// Whether to show border
  final bool showBorder;

  const AvatarWidget({
    super.key,
    required this.name,
    this.imageUrl,
    this.radius = 20,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    Widget avatar = CircleAvatar(
      radius: radius,
      backgroundColor: _getColorFromName(name),
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? Text(
              _getInitials(name),
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontSize: radius * 0.6,
              ),
            )
          : null,
    );

    if (showBorder) {
      avatar = Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: theme.colorScheme.outline,
            width: 2,
          ),
        ),
        child: avatar,
      );
    }

    return avatar;
  }

  /// Extracts initials from name (max 2 characters)
  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }

  /// Generates a color based on name (consistent for same name)
  Color _getColorFromName(String name) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
    ];
    
    final hash = name.codeUnits.fold(0, (prev, curr) => prev + curr);
    return colors[hash % colors.length];
  }
}