import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:soul_talk_clone/utils/styles/app_text_styles.dart';

class AuthTextField extends HookWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const AuthTextField({
    super.key,
    this.hintText,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final errorText = useState<String?>(null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: textController,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.blueGrey.shade700.withOpacity(0.4),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(0),
            ),
            errorText: errorText.value,
            errorStyle: AppTextStyle.body12R(
              color: Colors.red.shade400,
            ),
          ),
          validator: validator,
          onChanged: (value) {
            final error = validator?.call(value);
            errorText.value = error;
            if (onChanged != null) {
              onChanged!(value);
            }
          },
        ),
      ],
    );
  }
}
