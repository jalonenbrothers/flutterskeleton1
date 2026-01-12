import 'package:flutter/material.dart';
import '../extensions/context_extensions.dart';
import '../extensions/string_extensions.dart';
import '../extensions/date_extensions.dart';
import '../extensions/num_extensions.dart';
import '../utils/validators.dart';
import '../utils/helpers.dart';
import '../utils/formatters.dart';

/// Demo screen showcasing all extensions and utilities
/// 
/// This screen is for development purposes only and should be
/// removed or hidden in production builds.
class ExtensionsUtilsDemoScreen extends StatefulWidget {
  const ExtensionsUtilsDemoScreen({super.key});

  @override
  State<ExtensionsUtilsDemoScreen> createState() =>
      _ExtensionsUtilsDemoScreenState();
}

class _ExtensionsUtilsDemoScreenState extends State<ExtensionsUtilsDemoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extensions & Utils Demo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('Context Extensions'),
          _buildContextExtensionsDemo(),
          const SizedBox(height: 24),
          
          _buildSectionTitle('String Extensions'),
          _buildStringExtensionsDemo(),
          const SizedBox(height: 24),
          
          _buildSectionTitle('Date Extensions'),
          _buildDateExtensionsDemo(),
          const SizedBox(height: 24),
          
          _buildSectionTitle('Num Extensions'),
          _buildNumExtensionsDemo(),
          const SizedBox(height: 24),
          
          _buildSectionTitle('Validators & Formatters'),
          _buildValidatorsDemo(),
          const SizedBox(height: 24),
          
          _buildSectionTitle('Helpers'),
          _buildHelpersDemo(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: context.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colorScheme.primary,
      ),
    );
  }

  Widget _buildContextExtensionsDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Screen Width: ${context.screenWidth.toStringAsFixed(0)}'),
            Text('Screen Height: ${context.screenHeight.toStringAsFixed(0)}'),
            Text('Device Type: ${context.isMobile ? 'Mobile' : context.isTablet ? 'Tablet' : 'Desktop'}'),
            Text('Keyboard Open: ${context.isKeyboardOpen}'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                context.showSuccessSnackBar('Success! 🎉');
              },
              child: const Text('Show Success SnackBar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStringExtensionsDemo() {
    const email = 'test@example.com';
    const password = 'Test123!@#';
    const text = 'hello world';
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email validation: "$email" → ${email.isValidEmail ? '✓' : '✗'}'),
            Text('Password validation: "$password" → ${password.isValidPassword ? '✓' : '✗'}'),
            Text('Capitalize: "$text" → "${text.capitalize}"'),
            Text('Capitalize words: "$text" → "${text.capitalizeWords}"'),
            Text('Truncate: "Hello World" → "${"Hello World".truncate(5)}"'),
          ],
        ),
      ),
    );
  }

  Widget _buildDateExtensionsDemo() {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    final lastWeek = now.subtract(const Duration(days: 7));
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Now: ${now.toFormattedDateTime()}'),
            Text('Is today: ${now.isToday}'),
            Text('Yesterday: ${yesterday.toRelativeTime()}'),
            Text('Last week: ${lastWeek.toRelativeTime()}'),
            Text('Is this week: ${lastWeek.isThisWeek}'),
          ],
        ),
      ),
    );
  }

  Widget _buildNumExtensionsDemo() {
    const amount = 1234.56;
    const large = 1500000;
    const percentage = 0.1234;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Currency: $amount → ${amount.toCurrency()}'),
            Text('Compact: $large → ${large.toCompact()}'),
            Text('With commas: $large → ${large.withCommas()}'),
            Text('Percentage: $percentage → ${percentage.toPercentage()}'),
            Text('Between check: 5 is between 1-10? ${5.isBetween(1, 10)}'),
          ],
        ),
      ),
    );
  }

  Widget _buildValidatorsDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
                validator: Validators.email,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Min 8 chars, upper, lower, digit, special',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: Validators.password,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Auto-formatted as you type',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [Formatters.phoneNumber],
                keyboardType: TextInputType.phone,
                validator: Validators.phone,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.showSuccessSnackBar('All fields valid!');
                  }
                },
                child: const Text('Validate Form'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpersDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                await Helpers.lightHaptic();
                context.showSnackBar('Light haptic feedback');
              },
              child: const Text('Light Haptic'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final confirmed = await Helpers.showConfirmDialog(
                  context,
                  title: 'Confirmation',
                  message: 'Do you want to continue?',
                );
                if (confirmed) {
                  context.showSuccessSnackBar('Confirmed!');
                }
              },
              child: const Text('Show Confirm Dialog'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                await Helpers.copyToClipboard('Hello from clipboard!');
                context.showSuccessSnackBar('Copied to clipboard!');
              },
              child: const Text('Copy to Clipboard'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Helpers.unfocus(context);
                context.showSnackBar('Keyboard dismissed');
              },
              child: const Text('Dismiss Keyboard'),
            ),
          ],
        ),
      ),
    );
  }
}
