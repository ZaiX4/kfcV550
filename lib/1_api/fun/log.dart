import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

void logWithTag(String message, {String tag = 'yzx'}) {
  developer.log(message, name: tag);
}