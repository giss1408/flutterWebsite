import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';
import 'package:flutter_website/services/analytics_service.dart';

class ContactFormWidget extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final void Function(ContactFormData)? onSubmit;

  const ContactFormWidget({
    super.key,
    this.title,
    this.subtitle,
    this.onSubmit,
  });

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;
  String? _submitMessage;
  bool _submitSuccess = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
        _submitMessage = null;
      });

      try {
        final formData = ContactFormData(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          message: _messageController.text,
        );

        // Track form submission
        AnalyticsService().trackEvent(
          'contact_form_submitted',
          parameters: {
            'name': formData.name,
            'email': formData.email,
            'has_phone': formData.phone.isNotEmpty,
          },
        );

        // Call parent callback if provided
        widget.onSubmit?.call(formData);

        // Simulate email sending
        await Future.delayed(const Duration(milliseconds: 800));

        setState(() {
          _submitSuccess = true;
          _submitMessage = 'Thank you! Your message has been sent successfully.';
        });

        // Clear form
        _nameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _messageController.clear();

        // Hide success message after 5 seconds
        Future.delayed(const Duration(seconds: 5), () {
          if (mounted) {
            setState(() {
              _submitSuccess = false;
              _submitMessage = null;
            });
          }
        });
      } catch (e) {
        setState(() {
          _submitSuccess = false;
          _submitMessage = 'Error sending message. Please try again.';
        });
      } finally {
        setState(() {
          _isSubmitting = false;
        });
      }
    } else {
      AnalyticsService().trackEvent('contact_form_validation_failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: isDark ? ModernColors.backgroundCardDark : ModernColors.backgroundCard,
        borderRadius: BorderRadius.circular(ModernRadius.lg),
        border: Border.all(
          color: isDark ? ModernColors.borderDark : ModernColors.border,
        ),
        boxShadow: ModernShadows.elevation3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: ModernTypography.headlineLarge,
            ),
            const SizedBox(height: 8),
          ],
          if (widget.subtitle != null) ...[
            Text(
              widget.subtitle!,
              style: ModernTypography.bodyLarge.copyWith(
                color: isDark ? ModernColors.textLight : ModernColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
          ],
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Name field
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name *',
                    hintText: 'Your name',
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value.length < 2) {
                      return 'Name must be at least 2 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Email field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address *',
                    hintText: 'your.email@example.com',
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!_isValidEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Phone field (optional)
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number (Optional)',
                    hintText: '+1 (555) 000-0000',
                    prefixIcon: const Icon(Icons.phone_outlined),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!_isValidPhone(value)) {
                        return 'Please enter a valid phone number';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Message field
                TextFormField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    labelText: 'Message *',
                    hintText: 'Tell us about your inquiry...',
                    prefixIcon: const Icon(Icons.message_outlined),
                    alignLabelWithHint: true,
                  ),
                  minLines: 5,
                  maxLines: 8,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a message';
                    }
                    if (value.length < 10) {
                      return 'Message must be at least 10 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Status message
                if (_submitMessage != null)
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: _submitSuccess
                          ? ModernColors.success.withOpacity(0.1)
                          : ModernColors.error.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(ModernRadius.md),
                      border: Border.all(
                        color: _submitSuccess
                            ? ModernColors.success
                            : ModernColors.error,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _submitSuccess ? Icons.check_circle : Icons.error,
                          color: _submitSuccess
                              ? ModernColors.success
                              : ModernColors.error,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _submitMessage!,
                            style: ModernTypography.bodyMedium.copyWith(
                              color: _submitSuccess
                                  ? ModernColors.success
                                  : ModernColors.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // Submit button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ModernColors.primary,
                      disabledBackgroundColor: ModernColors.textTertiary,
                    ),
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : Text(
                            'Send Message',
                            style: ModernTypography.buttonLarge.copyWith(
                              color: ModernColors.textWhite,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  bool _isValidPhone(String phone) {
    final phoneRegex = RegExp(r'^[\d\s\-\+\(\)]{10,}$');
    return phoneRegex.hasMatch(phone);
  }
}

class ContactFormData {
  final String name;
  final String email;
  final String phone;
  final String message;

  ContactFormData({
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
  });

  @override
  String toString() =>
      'ContactFormData(name: $name, email: $email, phone: $phone, message: $message)';
}
