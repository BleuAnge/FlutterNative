part of 'cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final String username;
  final List<String> books;

  const HomeLoaded({
    required this.username,
    required this.books
  });

  @override
  List<Object> get props => [
    username,
    books
  ];

  HomeLoaded copyWith({
    String? username,
    List<String>? books
  }) {
    return HomeLoaded(
      username: username ?? this.username,
      books: books ?? this.books
    );
  }
}
