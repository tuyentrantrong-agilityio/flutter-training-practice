import 'package:flutter/material.dart';

import '../../models/category.dart';

extension CategoryExtension on Category {
  IconData get icon {
    return switch (name) {
      'Chair' => Icons.event_seat_outlined,
      'Table' => Icons.table_restaurant,
      'Armchair' => Icons.weekend,
      'Bed' => Icons.king_bed,
      'Lamp' => Icons.light,
      _ => Icons.star_outlined,
    };
  }
}
