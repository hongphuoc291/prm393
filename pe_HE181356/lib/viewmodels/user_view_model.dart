import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../repositories/in_memory_user_repository.dart';
import '../repositories/user_repository.dart';

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

class UserViewModel extends StateNotifier<UserState> {
  UserViewModel(this.repository) : super(const UserState(isLoading: true)) {
    loadUsers();
  }

  final UserRepository repository;

  Future<void> loadUsers() async {
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
    final newId = state.items.isEmpty
        ? 1
        : state.items
        .map((user) => user.id)
        .reduce((first, second) => first > second ? first : second) +
        1;

    final user = UserModel(
      id: newId,
      fullName: fullName,
      email: email,
      avatar: avatar,
    );

    await repository.addUser(user);

    state = state.copyWith(
      items: <UserModel>[
        ...state.items,
        user,
      ],
    );
  }

  Future<void> updateUser(UserModel user) async {
    await repository.updateUser(user);

    final updatedItems = state.items.map((item) {
      return item.id == user.id ? user : item;
    }).toList();

    state = state.copyWith(items: updatedItems);
  }

  Future<void> deleteUser(int id) async {
    await repository.deleteUser(id);

    final updatedItems = state.items
        .where((item) => item.id != id)
        .toList();

    state = state.copyWith(items: updatedItems);
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return InMemoryUserRepository();
});

final userViewModelProvider =
StateNotifierProvider<UserViewModel, UserState>((ref) {
  return UserViewModel(ref.watch(userRepositoryProvider));
});