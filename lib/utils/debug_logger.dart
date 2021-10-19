import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';

class DebugLogger {
  static void debugLog(String fileName, String functionName, String valueToPrint, int logType){
    ansiColorDisabled = false;

    switch(logType){
      case 1:
        // Use it to print errors
        _debugColorizedErrorLog('DEBUG => File: $fileName | Function: $functionName || $valueToPrint');
        break;
      case 2:
        // Use it to print value
        _debugColorizedBlueLog('DEBUG => File: $fileName | Function: $functionName || $valueToPrint');
        break;
      case 3:
        // Use it to print step in if true
        _debugColorizedGreenLog('DEBUG => File: $fileName | Function: $functionName || $valueToPrint');
        break;
      case 4:
        // Use it to print value in else
        _debugColorizedYellowLog('DEBUG => File: $fileName | Function: $functionName || $valueToPrint');
        break;
    }
  }

  static void _debugColorizedBlueLog(String message){
    AnsiPen pen = AnsiPen()..blue(bold: true);

    if (kDebugMode) {
      print(pen(message));
    }
  }

  static void _debugColorizedGreenLog(String message){
    AnsiPen pen = AnsiPen()..green(bold: true);

    if (kDebugMode) {
      print(pen(message));
    }
  }

  static void _debugColorizedYellowLog(String message){
    AnsiPen pen = AnsiPen()..yellow(bold: true);

    if (kDebugMode) {
      print(pen(message));
    }
  }

  static void _debugColorizedErrorLog(String message){
    AnsiPen pen = AnsiPen()..red(bold: true);

    if (kDebugMode) {
      print(pen(message));
    }
  }
}