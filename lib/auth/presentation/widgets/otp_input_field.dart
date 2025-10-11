import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpInputField extends StatefulWidget {
  const OtpInputField({super.key});

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool isFocused = false;
  int otp = 100000 + Random.secure().nextInt(900000); // 6-digit secure OTP

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();

    _controller.addListener(() {
      setState(() {});
    });

    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String text = _controller.text;
    return GestureDetector(
      onTap: () {
        if (!_focusNode.hasFocus) {
          _focusNode.requestFocus();
        } else {
          _focusNode.unfocus();
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: [
          Opacity(
            opacity: 0,
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              keyboardType: TextInputType.number,
              maxLength: 6,
              autofocus: true,
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                if (_controller.text.length == 6 &&
                    int.tryParse(_controller.text.toString()) == otp) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "entered OTP is $value",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Colors.greenAccent,
                      behavior:
                          SnackBarBehavior.floating, // makes it float above UI
                      margin: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "entered OTP is invalid",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  _focusNode.unfocus();
                }
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              final char = index < text.length ? text[index] : '';
              final hasFocus = index <= text.length;
              return Container(
                width: 50,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: hasFocus
                        ? const Color(0xCC89CAFF)
                        : Colors.transparent,
                  ),
                ),
                child: Center(
                  child: Text(
                    char,
                    style: GoogleFonts.jetBrainsMono(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
