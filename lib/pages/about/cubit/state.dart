part of 'cubit.dart';

sealed class AboutState extends Equatable {
  const AboutState();

  @override
  List<Object> get props => [];
}

final class AboutInitial extends AboutState {}

final class AboutLoading extends AboutState {}

final class AboutLoaded extends AboutState {}
