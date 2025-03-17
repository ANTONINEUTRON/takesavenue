import 'package:equatable/equatable.dart';
import 'package:takesavenue/utils/models/take.dart';
import 'package:takesavenue/utils/models/user.dart';

class TakesState extends Equatable {
  const TakesState({
    this.isLoading = false,
    this.isLoadingFeed = false,
    this.isLoadingUsers = false,
    this.isLoadingUserTake = false,
    this.userTakes = const [],
    this.takesFeed = const [],
    this.leaderboard = const [],
    this.userCache = const {},
  });

  final bool isLoading;
  final bool isLoadingFeed;
  final bool isLoadingUsers;
  final bool isLoadingUserTake;
  final List<Take> userTakes;
  final List<Take> takesFeed;
  final List<User> leaderboard;
  final Set<User> userCache;

  @override
  List<Object> get props => [
    isLoading,
    userTakes,
    takesFeed,
    isLoadingFeed,
    isLoadingUserTake,
    leaderboard,
    isLoadingUsers,
    userCache
  ];

  TakesState copyWith({
    bool? isLoading,
    List<Take>? userTakes,
    List<Take>? takesFeed,
    bool? isLoadingFeed,
    bool? isLoadingUsers,
    bool? isLoadingUserTake,
    List<User>? leaderboard,
    Set<User>? userCache,
  }) {
    return TakesState(
      isLoading: isLoading ?? this.isLoading,
      userTakes: userTakes ?? this.userTakes,
      takesFeed: takesFeed ?? this.takesFeed,
      isLoadingFeed: isLoadingFeed ?? this.isLoadingFeed,
      isLoadingUserTake: isLoadingUserTake ?? this.isLoadingUserTake,
      leaderboard: leaderboard ?? this.leaderboard,
      userCache: userCache ?? this.userCache,
      isLoadingUsers: isLoadingUsers ?? this.isLoadingUsers,
    );
  }
}
