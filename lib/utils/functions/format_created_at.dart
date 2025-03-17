
import 'package:intl/intl.dart';

String formatCreatedAt(DateTime? dateTime) {
  if (dateTime == null) return 'N/A';

  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays < 1) {
    if (difference.inHours < 1) {
      if (difference.inMinutes < 1) {
        return 'just now';
      }
      return '${difference.inMinutes}m ago';
    }
    return '${difference.inHours}h ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays}d ago';
  }

  return DateFormat('MMM d, y').format(dateTime);
}
