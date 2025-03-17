String getTimeLeft(DateTime? createdAt, int durationInDays) {
  if (createdAt == null) return 'N/A';

  final expiryDate = createdAt.add(Duration(days: durationInDays));
  final now = DateTime.now();
  final difference = expiryDate.difference(now);

  if (difference.isNegative) {
    return 'Expired';
  }

  final days = difference.inDays;
  final hours = difference.inHours % 24;

  if (days > 0) {
    return '${days}d ${hours}h';
  } else if (hours > 0) {
    return '${hours}h';
  } else {
    final minutes = difference.inMinutes % 60;
    return '${minutes}m';
  }
}
