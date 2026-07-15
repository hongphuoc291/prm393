import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';
import '../repositories/sqlite_user_repository.dart';
import '../repositories/user_repository.dart';

part 'user_view_model.g.dart';

class UserState {
  final List<UserModel> items;
  final bool isLoading;

  const UserState({
    this.items = const <UserModel>[],
    this.isLoading = false,
  });

  UserState copyWith({
    List<UserModel>? items,
    bool? isLoading,
  }) {
    return UserState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  return SqliteUserRepository();
}

@Riverpod(keepAlive: true)
class UserViewModel extends _$UserViewModel {
  @override
  UserState build() {
    Future<void>.microtask(loadUsers);

    return const UserState(
      isLoading: true,
    );
  }

  Future<void> loadUsers() async {
    final repository = ref.read(
      userRepositoryProvider,
    );

    final users = await repository.getUsers();

    state = state.copyWith(
      items: users,
      isLoading: false,
    );
  }

  Future<void> addUser({
    required String fullName,
    required String email,
    required String avatar,
  }) async {
    final repository = ref.read(
      userRepositoryProvider,
    );

    final user = UserModel(
      id: 0,
      fullName: fullName,
      email: email,
      avatar: avatar,
    );

    await repository.addUser(user);
    await loadUsers();
  }

  Future<void> updateUser(UserModel user) async {
    final repository = ref.read(
      userRepositoryProvider,
    );

    await repository.updateUser(user);
    await loadUsers();
  }

  Future<void> deleteUser(int id) async {
    final repository = ref.read(
      userRepositoryProvider,
    );

    await repository.deleteUser(id);
    await loadUsers();
  }
}