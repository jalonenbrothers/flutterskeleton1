# Step 5: Core Widgets Library - Completion Report

## Date Completed
[Current Date]

## ✅ Objectives Met

### 1. Custom Button Widget ✅
- ✅ Three variants: primary (filled), secondary (outlined), text
- ✅ Loading state with circular indicator
- ✅ Disabled state handling
- ✅ Optional icon support
- ✅ Full width and flexible width options
- ✅ Named constructors for each variant

### 2. Custom Text Field ✅
- ✅ Material 3 styling with OutlineInputBorder
- ✅ Validation support with error display
- ✅ Password visibility toggle
- ✅ Prefix and suffix icon support
- ✅ Multiple keyboard types
- ✅ Multiline support
- ✅ Character limit support
- ✅ Autofill hints
- ✅ Enabled/disabled states

### 3. Loading Indicator ✅
- ✅ Circular progress indicator
- ✅ Optional message display
- ✅ Configurable size
- ✅ Center/inline positioning
- ✅ Full-screen overlay variant

### 4. Error View ✅
- ✅ Error icon with customization
- ✅ Error message display
- ✅ Optional detailed description
- ✅ Retry callback support
- ✅ Theme-aware coloring

### 5. Empty State ✅
- ✅ Customizable icon
- ✅ Primary message
- ✅ Optional description
- ✅ Optional action button
- ✅ Centered layout

### 6. Custom App Bar ✅
- ✅ PreferredSizeWidget implementation
- ✅ Automatic back button
- ✅ Custom back callback
- ✅ Action buttons support
- ✅ Title centering option

### 7. Avatar Widget ✅
- ✅ Network image support
- ✅ Initials fallback (2 characters max)
- ✅ Color generation based on name
- ✅ Configurable radius
- ✅ Optional border
- ✅ Circular shape

### 8. Bottom Sheet Helper ✅
- ✅ Modal bottom sheet
- ✅ Bottom sheet with title and handle bar
- ✅ List selection bottom sheet
- ✅ Custom height support
- ✅ Dismissible/non-dismissible options
- ✅ Drag-to-dismiss support

### 9. Dialog Helper ✅
- ✅ Alert dialog
- ✅ Confirmation dialog with Yes/No
- ✅ Loading dialog
- ✅ Custom dialog support
- ✅ Destructive action styling
- ✅ Non-dismissible loading dialog

### 10. Widget Showcase Screen ✅
- ✅ Interactive examples of all widgets
- ✅ Code snippets as comments
- ✅ Organized into sections
- ✅ Form validation example
- ✅ Bottom sheet demonstrations
- ✅ Dialog demonstrations
- ✅ Avatar size variations

---

## 📋 Implementation Summary

Created a comprehensive library of 9 reusable widgets plus a showcase screen, all following Material 3 design principles and project coding standards. Each widget is:

- **Documented**: Complete DartDoc comments with usage examples
- **Testable**: Accepts callbacks and can be tested in isolation
- **Themeable**: Uses theme colors, no hardcoded values
- **Accessible**: Supports accessibility features
- **Composable**: Can be combined with other widgets
- **Consistent**: Follows same patterns and conventions

Total lines of code: ~1,450 lines across 10 files

---

## 📁 Files Created

| File | Lines | Purpose |
|------|-------|---------|
| `lib/core/widgets/custom_button.dart` | 160 | Button widget with 3 variants and loading state |
| `lib/core/widgets/custom_text_field.dart` | 145 | Text input with validation and password toggle |
| `lib/core/widgets/loading_indicator.dart` | 55 | Loading spinner with optional message |
| `lib/core/widgets/error_view.dart` | 80 | Error display with retry option |
| `lib/core/widgets/empty_state.dart` | 75 | Empty state with icon and action |
| `lib/core/widgets/custom_app_bar.dart` | 55 | App bar with consistent styling |
| `lib/core/widgets/avatar_widget.dart` | 105 | User avatar with image or initials |
| `lib/core/widgets/bottom_sheet_helper.dart` | 130 | Bottom sheet utilities |
| `lib/core/widgets/dialog_helper.dart` | 120 | Dialog utilities |
| `lib/core/widgets/widget_showcase_screen.dart` | 525 | Interactive widget demo screen |

---

## 📁 Files Modified

| File | Changes |
|------|---------|
| `lib/config/routes/app_router.dart` | Added `/widgets` route |
| `lib/features/home/presentation/screens/home_screen.dart` | Added navigation to widget showcase |

---

## 🧪 Testing Checklist & How to Test

### Setup
1. ✅ Run the app: `flutter run`
2. ✅ Navigate to Home screen
3. ✅ Tap "View Widget Showcase" button

### Test 5.1: Custom Button Widget

**Sub-step 5.1.1: Primary Button**
- [ ] In Widget Showcase, scroll to "1. Buttons" section
- [ ] Verify "Primary Button" displays with filled style
- [ ] Tap button → should show snackbar "Primary button pressed"
- [ ] Verify button uses primary color from theme

**Sub-step 5.1.2: Button with Icon**
- [ ] Tap "With Icon" button (has checkmark icon)
- [ ] Verify icon appears before text
- [ ] Verify spacing between icon and text (8px)
- [ ] Snackbar should show "Icon button pressed"

**Sub-step 5.1.3: Loading State**
- [ ] Observe "Loading" button
- [ ] Verify circular progress indicator displays
- [ ] Verify button is disabled (no tap response)
- [ ] Indicator should spin continuously

**Sub-step 5.1.4: Disabled State**
- [ ] Observe "Disabled" button
- [ ] Verify grayed-out appearance
- [ ] Tap button → should not respond
- [ ] No snackbar should appear

**Sub-step 5.1.5: Secondary Button**
- [ ] Tap "Secondary Button"
- [ ] Verify outlined style (border, no fill)
- [ ] Snackbar should show "Secondary button pressed"

**Sub-step 5.1.6: Text Button**
- [ ] Tap "Text Button"
- [ ] Verify no background or border
- [ ] Text should use primary color
- [ ] Snackbar should show "Text button pressed"

**Sub-step 5.1.7: Code Example**
- [ ] Verify code comment displays below buttons
- [ ] Comment should show CustomButton.primary example

**Expected Results**:
- ✅ All button variants render correctly
- ✅ Loading state prevents interaction
- ✅ Icons align properly
- ✅ Theme colors applied
- ✅ Tap callbacks work

---

### Test 5.2: Custom Text Field

**Sub-step 5.2.1: Email Field**
- [ ] In "2. Text Fields" section, tap email field
- [ ] Type "test" → should show no error yet
- [ ] Tap outside → error should appear: "Email is required" (empty) or "Invalid email format"
- [ ] Type "test@example.com" → error should clear
- [ ] Verify email icon appears as prefix

**Sub-step 5.2.2: Password Field**
- [ ] Tap password field
- [ ] Verify text is obscured (••••)
- [ ] Tap eye icon → text should become visible
- [ ] Tap eye icon again → text should obscure
- [ ] Type "123" → tap outside → should show "Password must be at least 6 characters"
- [ ] Type "123456" → error should clear

**Sub-step 5.2.3: Disabled Field**
- [ ] Observe "Disabled Field"
- [ ] Try to tap → should not focus
- [ ] Text should be grayed out
- [ ] Value "Cannot edit this" should display

**Sub-step 5.2.4: Multiline Field**
- [ ] Tap "Multiline Text" field
- [ ] Type several lines of text
- [ ] Verify field expands (up to 3 lines)
- [ ] Verify hint text disappears when typing

**Sub-step 5.2.5: Form Validation**
- [ ] Clear email and password fields
- [ ] Tap "Validate Form" button
- [ ] Both fields should show error messages
- [ ] Fill email with "user@test.com"
- [ ] Fill password with "password123"
- [ ] Tap "Validate Form" → should show "Form is valid!" snackbar

**Expected Results**:
- ✅ Validation triggers on submit and blur
- ✅ Error messages display in red
- ✅ Password visibility toggles work
- ✅ Icons appear correctly
- ✅ Multiline expands properly

---

### Test 5.3: Loading Indicator

**Sub-step 5.3.1: Static Loading**
- [ ] In "3. Loading Indicator" section, observe first indicator
- [ ] Verify circular spinner animates
- [ ] Message "Loading data..." displays below spinner
- [ ] Spinner should be centered

**Sub-step 5.3.2: Toggle Loading**
- [ ] Tap "Toggle Loading" button
- [ ] New loading indicator should appear below button
- [ ] Message "Processing..." should display
- [ ] After 2 seconds, indicator should disappear automatically

**Expected Results**:
- ✅ Spinner animates smoothly
- ✅ Message centers below spinner
- ✅ Size is appropriate (40px)
- ✅ Auto-dismiss works

---

### Test 5.4: Error View

**Sub-step 5.4.1: Error Display**
- [ ] In "4. Error View" section, observe error view
- [ ] Error icon (⚠️) should display in error color (red)
- [ ] Title "Failed to load data" in error color
- [ ] Description "Please check your connection..." in secondary text color
- [ ] "Retry" button with refresh icon displays

**Sub-step 5.4.2: Retry Action**
- [ ] Tap "Retry" button
- [ ] Snackbar "Retrying..." should appear
- [ ] Error view should remain visible (in real app, it would be replaced)

**Expected Results**:
- ✅ Icon size 64px
- ✅ Error color matches theme
- ✅ Text is centered
- ✅ Retry callback triggers

---

### Test 5.5: Empty State

**Sub-step 5.5.1: Empty Display**
- [ ] In "5. Empty State" section, observe empty state
- [ ] Inbox icon should display (large, 80px)
- [ ] Title "No items yet" displays
- [ ] Description "Your items will appear here..." displays
- [ ] "Add Item" button displays

**Sub-step 5.5.2: Action Button**
- [ ] Tap "Add Item" button
- [ ] Snackbar "Add item clicked" should appear

**Expected Results**:
- ✅ Icon uses outline color
- ✅ Content is centered
- ✅ Padding is appropriate (32px)
- ✅ Action button triggers callback

---

### Test 5.6: Custom App Bar

**Sub-step 5.6.1: App Bar Display**
- [ ] At top of Widget Showcase screen, observe app bar
- [ ] Title "Widget Showcase" should be centered
- [ ] Back button (←) should appear on left
- [ ] Info button (ⓘ) should appear on right

**Sub-step 5.6.2: Back Button**
- [ ] Tap back button
- [ ] Should navigate back to Home screen
- [ ] Navigate back to Widget Showcase

**Sub-step 5.6.3: Action Button**
- [ ] Tap info button (ⓘ)
- [ ] Alert dialog should appear with app info
- [ ] Dismiss dialog

**Expected Results**:
- ✅ Title is centered
- ✅ Back navigation works
- ✅ Actions appear correctly
- ✅ Height is standard (56dp)

---

### Test 5.7: Avatar Widget

**Sub-step 5.7.1: Initials Avatar**
- [ ] In "6. Avatars" section, observe first avatar
- [ ] Should display "JD" (initials from "John Doe")
- [ ] Background color should be blue (consistent for this name)
- [ ] Text color should be white
- [ ] Shape should be circular

**Sub-step 5.7.2: Avatar with Border**
- [ ] Observe second avatar ("Jane Smith")
- [ ] Should display "JS" initials
- [ ] Border should be visible around circle
- [ ] Border color should match theme outline

**Sub-step 5.7.3: Avatar with Image**
- [ ] Observe third avatar
- [ ] Should display a profile image from pravatar
- [ ] If image fails to load, should show initials "UN"
- [ ] Shape should be circular

**Sub-step 5.7.4: Different Sizes**
- [ ] Observe row of 4 avatars (Small, Medium, Large, XL)
- [ ] Verify sizes: Small < Medium < Large < XL
- [ ] All should maintain circular shape
- [ ] Initials should scale with size

**Expected Results**:
- ✅ Initials extracted correctly (first letter of first and last name)
- ✅ Color generation is consistent
- ✅ Image fallback works
- ✅ Border displays correctly
- ✅ Sizes scale appropriately

---

### Test 5.8: Bottom Sheet Helper

**Sub-step 5.8.1: Basic Bottom Sheet**
- [ ] In "7. Bottom Sheets" section, tap "Show Basic Bottom Sheet"
- [ ] Bottom sheet should slide up from bottom
- [ ] Should display "Basic Bottom Sheet" text
- [ ] "Close" button should display
- [ ] Tap "Close" → sheet should dismiss
- [ ] Tap button again, drag sheet down → should dismiss

**Sub-step 5.8.2: Bottom Sheet with Title**
- [ ] Tap "Show Bottom Sheet with Title"
- [ ] Handle bar should appear at top (gray line)
- [ ] Title "Bottom Sheet with Title" should display
- [ ] Divider below title
- [ ] Content should be scrollable if needed
- [ ] Tap "Got it" → should dismiss
- [ ] Show again, tap outside → should dismiss

**Sub-step 5.8.// filepath: _project-planning/05-core-widgets-complete.md
# Step 5: Core Widgets Library - Completion Report

## Date Completed
[Current Date]

## ✅ Objectives Met

### 1. Custom Button Widget ✅
- ✅ Three variants: primary (filled), secondary (outlined), text
- ✅ Loading state with circular indicator
- ✅ Disabled state handling
- ✅ Optional icon support
- ✅ Full width and flexible width options
- ✅ Named constructors for each variant

### 2. Custom Text Field ✅
- ✅ Material 3 styling with OutlineInputBorder
- ✅ Validation support with error display
- ✅ Password visibility toggle
- ✅ Prefix and suffix icon support
- ✅ Multiple keyboard types
- ✅ Multiline support
- ✅ Character limit support
- ✅ Autofill hints
- ✅ Enabled/disabled states

### 3. Loading Indicator ✅
- ✅ Circular progress indicator
- ✅ Optional message display
- ✅ Configurable size
- ✅ Center/inline positioning
- ✅ Full-screen overlay variant

### 4. Error View ✅
- ✅ Error icon with customization
- ✅ Error message display
- ✅ Optional detailed description
- ✅ Retry callback support
- ✅ Theme-aware coloring

### 5. Empty State ✅
- ✅ Customizable icon
- ✅ Primary message
- ✅ Optional description
- ✅ Optional action button
- ✅ Centered layout

### 6. Custom App Bar ✅
- ✅ PreferredSizeWidget implementation
- ✅ Automatic back button
- ✅ Custom back callback
- ✅ Action buttons support
- ✅ Title centering option

### 7. Avatar Widget ✅
- ✅ Network image support
- ✅ Initials fallback (2 characters max)
- ✅ Color generation based on name
- ✅ Configurable radius
- ✅ Optional border
- ✅ Circular shape

### 8. Bottom Sheet Helper ✅
- ✅ Modal bottom sheet
- ✅ Bottom sheet with title and handle bar
- ✅ List selection bottom sheet
- ✅ Custom height support
- ✅ Dismissible/non-dismissible options
- ✅ Drag-to-dismiss support

### 9. Dialog Helper ✅
- ✅ Alert dialog
- ✅ Confirmation dialog with Yes/No
- ✅ Loading dialog
- ✅ Custom dialog support
- ✅ Destructive action styling
- ✅ Non-dismissible loading dialog

### 10. Widget Showcase Screen ✅
- ✅ Interactive examples of all widgets
- ✅ Code snippets as comments
- ✅ Organized into sections
- ✅ Form validation example
- ✅ Bottom sheet demonstrations
- ✅ Dialog demonstrations
- ✅ Avatar size variations

---

## 📋 Implementation Summary

Created a comprehensive library of 9 reusable widgets plus a showcase screen, all following Material 3 design principles and project coding standards. Each widget is:

- **Documented**: Complete DartDoc comments with usage examples
- **Testable**: Accepts callbacks and can be tested in isolation
- **Themeable**: Uses theme colors, no hardcoded values
- **Accessible**: Supports accessibility features
- **Composable**: Can be combined with other widgets
- **Consistent**: Follows same patterns and conventions

Total lines of code: ~1,450 lines across 10 files

---

## 📁 Files Created

| File | Lines | Purpose |
|------|-------|---------|
| `lib/core/widgets/custom_button.dart` | 160 | Button widget with 3 variants and loading state |
| `lib/core/widgets/custom_text_field.dart` | 145 | Text input with validation and password toggle |
| `lib/core/widgets/loading_indicator.dart` | 55 | Loading spinner with optional message |
| `lib/core/widgets/error_view.dart` | 80 | Error display with retry option |
| `lib/core/widgets/empty_state.dart` | 75 | Empty state with icon and action |
| `lib/core/widgets/custom_app_bar.dart` | 55 | App bar with consistent styling |
| `lib/core/widgets/avatar_widget.dart` | 105 | User avatar with image or initials |
| `lib/core/widgets/bottom_sheet_helper.dart` | 130 | Bottom sheet utilities |
| `lib/core/widgets/dialog_helper.dart` | 120 | Dialog utilities |
| `lib/core/widgets/widget_showcase_screen.dart` | 525 | Interactive widget demo screen |

---

## 📁 Files Modified

| File | Changes |
|------|---------|
| `lib/config/routes/app_router.dart` | Added `/widgets` route |
| `lib/features/home/presentation/screens/home_screen.dart` | Added navigation to widget showcase |

---

## 🧪 Testing Checklist & How to Test

### Setup
1. ✅ Run the app: `flutter run`
2. ✅ Navigate to Home screen
3. ✅ Tap "View Widget Showcase" button

### Test 5.1: Custom Button Widget

**Sub-step 5.1.1: Primary Button**
- [ ] In Widget Showcase, scroll to "1. Buttons" section
- [ ] Verify "Primary Button" displays with filled style
- [ ] Tap button → should show snackbar "Primary button pressed"
- [ ] Verify button uses primary color from theme

**Sub-step 5.1.2: Button with Icon**
- [ ] Tap "With Icon" button (has checkmark icon)
- [ ] Verify icon appears before text
- [ ] Verify spacing between icon and text (8px)
- [ ] Snackbar should show "Icon button pressed"

**Sub-step 5.1.3: Loading State**
- [ ] Observe "Loading" button
- [ ] Verify circular progress indicator displays
- [ ] Verify button is disabled (no tap response)
- [ ] Indicator should spin continuously

**Sub-step 5.1.4: Disabled State**
- [ ] Observe "Disabled" button
- [ ] Verify grayed-out appearance
- [ ] Tap button → should not respond
- [ ] No snackbar should appear

**Sub-step 5.1.5: Secondary Button**
- [ ] Tap "Secondary Button"
- [ ] Verify outlined style (border, no fill)
- [ ] Snackbar should show "Secondary button pressed"

**Sub-step 5.1.6: Text Button**
- [ ] Tap "Text Button"
- [ ] Verify no background or border
- [ ] Text should use primary color
- [ ] Snackbar should show "Text button pressed"

**Sub-step 5.1.7: Code Example**
- [ ] Verify code comment displays below buttons
- [ ] Comment should show CustomButton.primary example

**Expected Results**:
- ✅ All button variants render correctly
- ✅ Loading state prevents interaction
- ✅ Icons align properly
- ✅ Theme colors applied
- ✅ Tap callbacks work

---

### Test 5.2: Custom Text Field

**Sub-step 5.2.1: Email Field**
- [ ] In "2. Text Fields" section, tap email field
- [ ] Type "test" → should show no error yet
- [ ] Tap outside → error should appear: "Email is required" (empty) or "Invalid email format"
- [ ] Type "test@example.com" → error should clear
- [ ] Verify email icon appears as prefix

**Sub-step 5.2.2: Password Field**
- [ ] Tap password field
- [ ] Verify text is obscured (••••)
- [ ] Tap eye icon → text should become visible
- [ ] Tap eye icon again → text should obscure
- [ ] Type "123" → tap outside → should show "Password must be at least 6 characters"
- [ ] Type "123456" → error should clear

**Sub-step 5.2.3: Disabled Field**
- [ ] Observe "Disabled Field"
- [ ] Try to tap → should not focus
- [ ] Text should be grayed out
- [ ] Value "Cannot edit this" should display

**Sub-step 5.2.4: Multiline Field**
- [ ] Tap "Multiline Text" field
- [ ] Type several lines of text
- [ ] Verify field expands (up to 3 lines)
- [ ] Verify hint text disappears when typing

**Sub-step 5.2.5: Form Validation**
- [ ] Clear email and password fields
- [ ] Tap "Validate Form" button
- [ ] Both fields should show error messages
- [ ] Fill email with "user@test.com"
- [ ] Fill password with "password123"
- [ ] Tap "Validate Form" → should show "Form is valid!" snackbar

**Expected Results**:
- ✅ Validation triggers on submit and blur
- ✅ Error messages display in red
- ✅ Password visibility toggles work
- ✅ Icons appear correctly
- ✅ Multiline expands properly

---

### Test 5.3: Loading Indicator

**Sub-step 5.3.1: Static Loading**
- [ ] In "3. Loading Indicator" section, observe first indicator
- [ ] Verify circular spinner animates
- [ ] Message "Loading data..." displays below spinner
- [ ] Spinner should be centered

**Sub-step 5.3.2: Toggle Loading**
- [ ] Tap "Toggle Loading" button
- [ ] New loading indicator should appear below button
- [ ] Message "Processing..." should display
- [ ] After 2 seconds, indicator should disappear automatically

**Expected Results**:
- ✅ Spinner animates smoothly
- ✅ Message centers below spinner
- ✅ Size is appropriate (40px)
- ✅ Auto-dismiss works

---

### Test 5.4: Error View

**Sub-step 5.4.1: Error Display**
- [ ] In "4. Error View" section, observe error view
- [ ] Error icon (⚠️) should display in error color (red)
- [ ] Title "Failed to load data" in error color
- [ ] Description "Please check your connection..." in secondary text color
- [ ] "Retry" button with refresh icon displays

**Sub-step 5.4.2: Retry Action**
- [ ] Tap "Retry" button
- [ ] Snackbar "Retrying..." should appear
- [ ] Error view should remain visible (in real app, it would be replaced)

**Expected Results**:
- ✅ Icon size 64px
- ✅ Error color matches theme
- ✅ Text is centered
- ✅ Retry callback triggers

---

### Test 5.5: Empty State

**Sub-step 5.5.1: Empty Display**
- [ ] In "5. Empty State" section, observe empty state
- [ ] Inbox icon should display (large, 80px)
- [ ] Title "No items yet" displays
- [ ] Description "Your items will appear here..." displays
- [ ] "Add Item" button displays

**Sub-step 5.5.2: Action Button**
- [ ] Tap "Add Item" button
- [ ] Snackbar "Add item clicked" should appear

**Expected Results**:
- ✅ Icon uses outline color
- ✅ Content is centered
- ✅ Padding is appropriate (32px)
- ✅ Action button triggers callback

---

### Test 5.6: Custom App Bar

**Sub-step 5.6.1: App Bar Display**
- [ ] At top of Widget Showcase screen, observe app bar
- [ ] Title "Widget Showcase" should be centered
- [ ] Back button (←) should appear on left
- [ ] Info button (ⓘ) should appear on right

**Sub-step 5.6.2: Back Button**
- [ ] Tap back button
- [ ] Should navigate back to Home screen
- [ ] Navigate back to Widget Showcase

**Sub-step 5.6.3: Action Button**
- [ ] Tap info button (ⓘ)
- [ ] Alert dialog should appear with app info
- [ ] Dismiss dialog

**Expected Results**:
- ✅ Title is centered
- ✅ Back navigation works
- ✅ Actions appear correctly
- ✅ Height is standard (56dp)

---

### Test 5.7: Avatar Widget

**Sub-step 5.7.1: Initials Avatar**
- [ ] In "6. Avatars" section, observe first avatar
- [ ] Should display "JD" (initials from "John Doe")
- [ ] Background color should be blue (consistent for this name)
- [ ] Text color should be white
- [ ] Shape should be circular

**Sub-step 5.7.2: Avatar with Border**
- [ ] Observe second avatar ("Jane Smith")
- [ ] Should display "JS" initials
- [ ] Border should be visible around circle
- [ ] Border color should match theme outline

**Sub-step 5.7.3: Avatar with Image**
- [ ] Observe third avatar
- [ ] Should display a profile image from pravatar
- [ ] If image fails to load, should show initials "UN"
- [ ] Shape should be circular

**Sub-step 5.7.4: Different Sizes**
- [ ] Observe row of 4 avatars (Small, Medium, Large, XL)
- [ ] Verify sizes: Small < Medium < Large < XL
- [ ] All should maintain circular shape
- [ ] Initials should scale with size

**Expected Results**:
- ✅ Initials extracted correctly (first letter of first and last name)
- ✅ Color generation is consistent
- ✅ Image fallback works
- ✅ Border displays correctly
- ✅ Sizes scale appropriately

---

### Test 5.8: Bottom Sheet Helper

**Sub-step 5.8.1: Basic Bottom Sheet**
- [ ] In "7. Bottom Sheets" section, tap "Show Basic Bottom Sheet"
- [ ] Bottom sheet should slide up from bottom
- [ ] Should display "Basic Bottom Sheet" text
- [ ] "Close" button should display
- [ ] Tap "Close" → sheet should dismiss
- [ ] Tap button again, drag sheet down → should dismiss

**Sub-step 5.8.2: Bottom Sheet with Title**
- [ ] Tap "Show Bottom Sheet with Title"
- [ ] Handle bar should appear at top (gray line)
- [ ] Title "Bottom Sheet with Title" should display
- [ ] Divider below title
- [ ] Content should be scrollable if needed
- [ ] Tap "Got it" → should dismiss
- [ ] Show again, tap outside → should dismiss

**Sub-step 5.8.