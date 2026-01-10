import 'package:flutter/material.dart';
import 'package:flutterskeleton1/core/widgets/avatar_widget.dart';
import 'package:flutterskeleton1/core/widgets/bottom_sheet_helper.dart';
import 'package:flutterskeleton1/core/widgets/custom_app_bar.dart';
import 'package:flutterskeleton1/core/widgets/custom_button.dart';
import 'package:flutterskeleton1/core/widgets/custom_text_field.dart';
import 'package:flutterskeleton1/core/widgets/dialog_helper.dart';
import 'package:flutterskeleton1/core/widgets/empty_state.dart';
import 'package:flutterskeleton1/core/widgets/error_view.dart';
import 'package:flutterskeleton1/core/widgets/loading_indicator.dart';

/// Showcase screen demonstrating all custom widgets
///
/// Displays interactive examples of all widgets in the core widgets library.
/// Useful for testing and documentation purposes.
class WidgetShowcaseScreen extends StatefulWidget {
  const WidgetShowcaseScreen({super.key});

  @override
  State<WidgetShowcaseScreen> createState() => _WidgetShowcaseScreenState();
}

class _WidgetShowcaseScreenState extends State<WidgetShowcaseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Widget Showcase',
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showInfo(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            title: '1. Buttons',
            child: _buildButtonsSection(),
          ),
          _buildSection(
            title: '2. Text Fields',
            child: _buildTextFieldsSection(),
          ),
          _buildSection(
            title: '3. Loading Indicator',
            child: _buildLoadingSection(),
          ),
          _buildSection(
            title: '4. Error View',
            child: _buildErrorSection(),
          ),
          _buildSection(
            title: '5. Empty State',
            child: _buildEmptyStateSection(),
          ),
          _buildSection(
            title: '6. Avatars',
            child: _buildAvatarsSection(),
          ),
          _buildSection(
            title: '7. Bottom Sheets',
            child: _buildBottomSheetSection(),
          ),
          _buildSection(
            title: '8. Dialogs',
            child: _buildDialogsSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Primary buttons
        CustomButton.primary(
          text: 'Primary Button',
          onPressed: () => _showSnackBar('Primary button pressed'),
        ),
        const SizedBox(height: 8),
        CustomButton.primary(
          text: 'With Icon',
          icon: Icons.check,
          onPressed: () => _showSnackBar('Icon button pressed'),
        ),
        const SizedBox(height: 8),
        CustomButton.primary(
          text: 'Loading',
          isLoading: true,
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        const CustomButton.primary(
          text: 'Disabled',
          onPressed: null,
        ),
        const SizedBox(height: 16),
        
        // Secondary buttons
        CustomButton.secondary(
          text: 'Secondary Button',
          onPressed: () => _showSnackBar('Secondary button pressed'),
        ),
        const SizedBox(height: 8),
        CustomButton.secondary(
          text: 'With Icon',
          icon: Icons.edit,
          onPressed: () => _showSnackBar('Secondary icon button pressed'),
        ),
        const SizedBox(height: 16),
        
        // Text buttons
        CustomButton.text(
          text: 'Text Button',
          onPressed: () => _showSnackBar('Text button pressed'),
        ),
        const SizedBox(height: 8),
        CustomButton.text(
          text: 'With Icon',
          icon: Icons.arrow_forward,
          onPressed: () => _showSnackBar('Text icon button pressed'),
        ),
        
        const SizedBox(height: 8),
        Text(
          '// Code example:\n'
          '// CustomButton.primary(\n'
          '//   text: \'Submit\',\n'
          '//   icon: Icons.check,\n'
          '//   onPressed: () => submit(),\n'
          '//   isLoading: isSubmitting,\n'
          '// )',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
              ),
        ),
      ],
    );
  }

  Widget _buildTextFieldsSection() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Email',
            hint: 'Enter your email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              if (!value.contains('@')) {
                return 'Invalid email format';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Password',
            hint: 'Enter your password',
            controller: _passwordController,
            obscureText: true,
            prefixIcon: Icons.lock,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            label: 'Disabled Field',
            initialValue: 'Cannot edit this',
            enabled: false,
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            label: 'Multiline Text',
            hint: 'Enter multiple lines...',
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          CustomButton.primary(
            text: 'Validate Form',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _showSnackBar('Form is valid!');
              }
            },
          ),
          const SizedBox(height: 8),
          Text(
            '// Code example:\n'
            '// CustomTextField(\n'
            '//   label: \'Email\',\n'
            '//   controller: emailController,\n'
            '//   validator: (value) => \n'
            '//     value?.isEmpty ?? true ? \'Required\' : null,\n'
            '// )',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontFamily: 'monospace',
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingSection() {
    return Column(
      children: [
        const LoadingIndicator(
          message: 'Loading data...',
          size: 40,
        ),
        const SizedBox(height: 16),
        CustomButton.primary(
          text: 'Toggle Loading',
          onPressed: () {
            setState(() => _isLoading = !_isLoading);
            if (_isLoading) {
              Future.delayed(const Duration(seconds: 2), () {
                if (mounted) setState(() => _isLoading = false);
              });
            }
          },
        ),
        if (_isLoading) ...[
          const SizedBox(height: 16),
          const LoadingIndicator(message: 'Processing...'),
        ],
        const SizedBox(height: 8),
        Text(
          '// Code example:\n'
          '// LoadingIndicator(\n'
          '//   message: \'Loading data...\',\n'
          '// )',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
              ),
        ),
      ],
    );
  }

  Widget _buildErrorSection() {
    return Column(
      children: [
        ErrorView(
          message: 'Failed to load data',
          details: 'Please check your connection and try again',
          onRetry: () => _showSnackBar('Retrying...'),
          center: false,
        ),
        const SizedBox(height: 8),
        Text(
          '// Code example:\n'
          '// ErrorView(\n'
          '//   message: \'Failed to load data\',\n'
          '//   onRetry: () => loadData(),\n'
          '// )',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
              ),
        ),
      ],
    );
  }

  Widget _buildEmptyStateSection() {
    return Column(
      children: [
        EmptyState(
          icon: Icons.inbox,
          message: 'No items yet',
          description: 'Your items will appear here when you add them',
          actionLabel: 'Add Item',
          onAction: () => _showSnackBar('Add item clicked'),
        ),
        const SizedBox(height: 8),
        Text(
          '// Code example:\n'
          '// EmptyState(\n'
          '//   icon: Icons.inbox,\n'
          '//   message: \'No messages\',\n'
          '//   actionLabel: \'Compose\',\n'
          '//   onAction: () => compose(),\n'
          '// )',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
              ),
        ),
      ],
    );
  }

  Widget _buildAvatarsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                AvatarWidget(name: 'John Doe', radius: 30),
                SizedBox(height: 8),
                Text('Initials', style: TextStyle(fontSize: 12)),
              ],
            ),
            const Column(
              children: [
                AvatarWidget(
                  name: 'Jane Smith',
                  radius: 30,
                  showBorder: true,
                ),
                SizedBox(height: 8),
                Text('With Border', style: TextStyle(fontSize: 12)),
              ],
            ),
            Column(
              children: [
                AvatarWidget(
                  name: 'User Name',
                  imageUrl: 'https://i.pravatar.cc/150?img=1',
                  radius: 30,
                ),
                const SizedBox(height: 8),
                const Text('With Image', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AvatarWidget(name: 'Small', radius: 16),
            AvatarWidget(name: 'Medium', radius: 24),
            AvatarWidget(name: 'Large', radius: 32),
            AvatarWidget(name: 'XL', radius: 40),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          '// Code example:\n'
          '// AvatarWidget(\n'
          '//   name: \'John Doe\',\n'
          '//   imageUrl: user.avatarUrl,\n'
          '//   radius: 24,\n'
          '// )',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
              ),
        ),
      ],
    );
  }

  Widget _buildBottomSheetSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomButton.primary(
          text: 'Show Basic Bottom Sheet',
          onPressed: () => _showBasicBottomSheet(),
        ),
        const SizedBox(height: 8),
        CustomButton.primary(
          text: 'Show Bottom Sheet with Title',
          onPressed: () => _showTitledBottomSheet(),
        ),
        const SizedBox(height: 8),
        CustomButton.primary(
          text: 'Show List Bottom Sheet',
          onPressed: () => _showListBottomSheet(),
        ),
        const SizedBox(height: 8),
        Text(
          '// Code example:\n'
          '// BottomSheetHelper.showWithTitle(\n'
          '//   context,\n'
          '//   title: \'Options\',\n'
          '//   child: MyContent(),\n'
          '// )',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
              ),
        ),
      ],
    );
  }

  Widget _buildDialogsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomButton.primary(
          text: 'Show Alert Dialog',
          onPressed: () => _showAlertDialog(),
        ),
        const SizedBox(height: 8),
        CustomButton.primary(
          text: 'Show Confirmation Dialog',
          onPressed: () => _showConfirmationDialog(),
        ),
        const SizedBox(height: 8),
        CustomButton.primary(
          text: 'Show Loading Dialog',
          onPressed: () => _showLoadingDialog(),
        ),
        const SizedBox(height: 8),
        Text(
          '// Code example:\n'
          '// final confirmed = await \n'
          '//   DialogHelper.showConfirmation(\n'
          '//   context,\n'
          '//   title: \'Delete?\',\n'
          '//   message: \'Are you sure?\',\n'
          '// );',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
              ),
        ),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showInfo() {
    DialogHelper.showAlert(
      context,
      title: 'Widget Showcase',
      message: 'This screen demonstrates all custom widgets in the app. '
          'Test each widget to see how it behaves.',
    );
  }

  void _showBasicBottomSheet() {
    BottomSheetHelper.show(
      context,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Basic Bottom Sheet'),
            const SizedBox(height: 16),
            CustomButton.primary(
              text: 'Close',
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showTitledBottomSheet() {
    BottomSheetHelper.showWithTitle(
      context,
      title: 'Bottom Sheet with Title',
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('This bottom sheet has a title and a handle bar.'),
            const SizedBox(height: 16),
            CustomButton.primary(
              text: 'Got it',
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showListBottomSheet() async {
    final result = await BottomSheetHelper.showList<String>(
      context,
      title: 'Select Option',
      items: [
        const BottomSheetItem(
          label: 'Option 1',
          subtitle: 'First option description',
          icon: Icons.looks_one,
          value: 'option1',
        ),
        const BottomSheetItem(
          label: 'Option 2',
          subtitle: 'Second option description',
          icon: Icons.looks_two,
          value: 'option2',
        ),
        const BottomSheetItem(
          label: 'Option 3',
          subtitle: 'Third option description',
          icon: Icons.looks_3,
          value: 'option3',
        ),
      ],
    );
    
    if (result != null && mounted) {
      _showSnackBar('Selected: $result');
    }
  }

  void _showAlertDialog() {
    DialogHelper.showAlert(
      context,
      title: 'Alert',
      message: 'This is a simple alert dialog.',
    );
  }

  void _showConfirmationDialog() async {
    final confirmed = await DialogHelper.showConfirmation(
      context,
      title: 'Confirmation',
      message: 'Are you sure you want to proceed?',
      confirmText: 'Yes',
      cancelText: 'No',
    );
    
    if (mounted) {
      _showSnackBar(confirmed ? 'Confirmed' : 'Cancelled');
    }
  }

  void _showLoadingDialog() {
    DialogHelper.showLoading(context, message: 'Processing...');
    
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        DialogHelper.hideLoading(context);
        _showSnackBar('Done!');
      }
    });
  }
}