import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Utils {
  Utils._();
}

extension StringExtension on String {
  String capitalize() {
    return isNotEmpty
        ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}"
        : this;
  }

  String capitalizeWords() {
    return split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      } else {
        return word;
      }
    }).join(' ');
  }
}

extension TimeOfDayExtension on TimeOfDay {
  String format24h() {
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }
}

extension DateTimeExtension on DateTime {
  String formatDayMonthYear() {
    final formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(this);
  }

  String formatDateTimeToHumanString() {
    final formatter = DateFormat("dd MMMM yyyy HH:mm", 'fr_FR');
    return formatter.format(this);
  }

  String formatDateToHumanString() {
    final formatter = DateFormat("dd MMMM yyyy", 'fr_FR');
    return formatter.format(this);
  }

  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week';
    } else {
      return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
    }
  }
}
