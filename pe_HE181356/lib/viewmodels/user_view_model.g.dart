// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'd489fd1bd6d676443a626e04f1c0070a657cea86';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = Provider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserRepositoryRef = ProviderRef<UserRepository>;
String _$userViewModelHash() => r'a59dbecbea90d4be159bd32db08ccbc44ff0ea75';

/// See also [UserViewModel].
@ProviderFor(UserViewModel)
final userViewModelProvider =
    NotifierProvider<UserViewModel, UserState>.internal(
      UserViewModel.new,
      name: r'userViewModelProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UserViewModel = Notifier<UserState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
