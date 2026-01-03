// lib/core/constants/app_dimensions.dart
/// App dimension constants for consistent spacing and sizing
/// 
/// Following 4px base grid system for Material Design
class AppDimensions {
  AppDimensions._(); // Private constructor

  // ============================================================================
  // SPACING SCALE (4px base)
  // ============================================================================

  /// Extra small spacing - 4px
  static const double spacingXs = 4.0;

  /// Small spacing - 8px
  static const double spacingSm = 8.0;

  /// Medium spacing - 12px
  static const double spacingMd = 12.0;

  /// Default spacing - 16px
  static const double spacing = 16.0;

  /// Large spacing - 24px
  static const double spacingLg = 24.0;

  /// Extra large spacing - 32px
  static const double spacingXl = 32.0;

  /// 2XL spacing - 48px
  static const double spacing2xl = 48.0;

  /// 3XL spacing - 64px
  static const double spacing3xl = 64.0;

  // ============================================================================
  // BORDER RADIUS
  // ============================================================================

  /// Small border radius - 4px (subtle rounding)
  static const double radiusSm = 4.0;

  /// Medium border radius - 8px (default for most elements)
  static const double radiusMd = 8.0;

  /// Large border radius - 12px (cards, containers)
  static const double radiusLg = 12.0;

  /// Extra large border radius - 16px (prominent cards)
  static const double radiusXl = 16.0;

  /// 2XL border radius - 24px (bottom sheets, modals)
  static const double radius2xl = 24.0;

  /// Full circular radius
  static const double radiusFull = 9999.0;

  // ============================================================================
  // ICON SIZES
  // ============================================================================

  /// Extra small icon - 16px
  static const double iconXs = 16.0;

  /// Small icon - 20px
  static const double iconSm = 20.0;

  /// Medium icon - 24px (default)
  static const double iconMd = 24.0;

  /// Large icon - 32px
  static const double iconLg = 32.0;

  /// Extra large icon - 48px
  static const double iconXl = 48.0;

  /// 2XL icon - 64px
  static const double icon2xl = 64.0;

  // ============================================================================
  // BUTTON SIZES
  // ============================================================================

  /// Small button height - 36px
  static const double buttonHeightSm = 36.0;

  /// Medium button height - 48px (default)
  static const double buttonHeightMd = 48.0;

  /// Large button height - 56px
  static const double buttonHeightLg = 56.0;

  /// Button minimum width
  static const double buttonMinWidth = 88.0;

  /// Button horizontal padding
  static const double buttonPaddingHorizontal = 24.0;

  // ============================================================================
  // FORM FIELD DIMENSIONS
  // ============================================================================

  /// Form field height - 56px
  static const double formFieldHeight = 56.0;

  /// Form field border width
  static const double formFieldBorderWidth = 1.0;

  /// Form field focused border width
  static const double formFieldFocusedBorderWidth = 2.0;

  /// Form field horizontal padding
  static const double formFieldPaddingHorizontal = 16.0;

  /// Form field vertical padding
  static const double formFieldPaddingVertical = 16.0;

  // ============================================================================
  // APP BAR
  // ============================================================================

  /// App bar height
  static const double appBarHeight = 56.0;

  /// App bar elevation
  static const double appBarElevation = 0.0;

  // ============================================================================
  // CARD & CONTAINER
  // ============================================================================

  /// Card elevation
  static const double cardElevation = 1.0;

  /// Card padding
  static const double cardPadding = 16.0;

  /// Container padding
  static const double containerPadding = 16.0;

  // ============================================================================
  // DIVIDER
  // ============================================================================

  /// Divider thickness
  static const double dividerThickness = 1.0;

  /// Divider indent
  static const double dividerIndent = 16.0;

  // ============================================================================
  // AVATAR SIZES
  // ============================================================================

  /// Small avatar - 32px
  static const double avatarSm = 32.0;

  /// Medium avatar - 40px
  static const double avatarMd = 40.0;

  /// Large avatar - 56px
  static const double avatarLg = 56.0;

  /// Extra large avatar - 80px
  static const double avatarXl = 80.0;

  // ============================================================================
  // RESPONSIVE BREAKPOINTS
  // ============================================================================

  /// Mobile breakpoint (up to 600px)
  static const double breakpointMobile = 600.0;

  /// Tablet breakpoint (600px - 1024px)
  static const double breakpointTablet = 1024.0;

  /// Desktop breakpoint (1024px and above)
  static const double breakpointDesktop = 1440.0;

  // ============================================================================
  // SCREEN PADDING
  // ============================================================================

  /// Default screen horizontal padding
  static const double screenPaddingHorizontal = 16.0;

  /// Default screen vertical padding
  static const double screenPaddingVertical = 16.0;

  /// Screen padding for tablets
  static const double screenPaddingHorizontalTablet = 24.0;

  /// Screen padding for desktop
  static const double screenPaddingHorizontalDesktop = 32.0;

  // ============================================================================
  // BOTTOM NAVIGATION
  // ============================================================================

  /// Bottom navigation bar height
  static const double bottomNavHeight = 56.0;

  /// Bottom navigation icon size
  static const double bottomNavIconSize = 24.0;

  // ============================================================================
  // LIST ITEMS
  // ============================================================================

  /// List tile height (single line)
  static const double listTileHeight = 56.0;

  /// List tile height (two lines)
  static const double listTileHeightTwoLine = 72.0;

  /// List tile height (three lines)
  static const double listTileHeightThreeLine = 88.0;

  // ============================================================================
  // SHADOWS & ELEVATION
  // ============================================================================

  /// No elevation
  static const double elevation0 = 0.0;

  /// Subtle elevation
  static const double elevation1 = 1.0;

  /// Default elevation
  static const double elevation2 = 2.0;

  /// Raised elevation
  static const double elevation4 = 4.0;

  /// High elevation
  static const double elevation8 = 8.0;

  /// Maximum elevation
  static const double elevation16 = 16.0;
}