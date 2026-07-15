import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../viewmodels/user_view_model.dart';
import '../widgets/avatar_image.dart';
import 'user_detail_screen.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  ConsumerState<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _avatarController = TextEditingController();

  UserModel? _editingUser;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _avatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Manager'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWideLayout =
                constraints.maxWidth >= constraints.maxHeight ||
                    constraints.maxWidth >= 700;

            if (isWideLayout) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: _buildForm(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 3,
                      child: _buildUserList(
                        users: state.items,
                        isLandscape: true,
                      ),
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  _buildForm(),
                  const SizedBox(height: 12),
                  Expanded(
                    child: _buildUserList(
                      users: state.items,
                      isLandscape: false,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: const Key('input_fullname'),
            controller: _fullNameController,
            decoration: const InputDecoration(
              labelText: 'Họ và tên',
              hintText: 'Nhập họ và tên',
              border: OutlineInputBorder(),
            ),
            validator: _validateFullName,
          ),
          const SizedBox(height: 8),
          TextFormField(
            key: const Key('input_email'),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'example@gmail.com',
              border: OutlineInputBorder(),
            ),
            validator: _validateEmail,
          ),
          const SizedBox(height: 8),
          TextFormField(
            key: const Key('input_avatar'),
            controller: _avatarController,
            decoration: InputDecoration(
              labelText: 'Avatar',
              hintText: defaultAvatarPath,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  _avatarController.text = defaultAvatarPath;
                },
                icon: const Icon(Icons.image),
              ),
            ),
            validator: _validateAvatar,
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  key: const Key('btn_add_user'),
                  onPressed: _handleSubmit,
                  child: Text(
                    _editingUser == null ? 'ADD USER' : 'UPDATE USER',
                  ),
                ),
              ),
              if (_editingUser != null) ...<Widget>[
                const SizedBox(width: 8),
                OutlinedButton(
                  key: const Key('btn_cancel_edit'),
                  onPressed: _cancelEdit,
                  child: const Text('CANCEL'),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserList({
    required List<UserModel> users,
    required bool isLandscape,
  }) {
    return GridView.builder(
      key: const Key('user_list'),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isLandscape ? 2 : 1,
        mainAxisExtent: 104,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            key: Key('user_item_${user.id}'),
            onTap: () => _openDetail(user),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  AvatarImage(
                    key: Key('user_item_avatar_${user.id}'),
                    avatar: user.avatar,
                    radius: 22,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          user.fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          user.email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    key: Key('user_item_edit_${user.id}'),
                    icon: const Icon(Icons.edit),
                    onPressed: () => _startEdit(user),
                    visualDensity: VisualDensity.compact,
                    tooltip: 'Sửa',
                  ),
                  IconButton(
                    key: Key('user_item_delete_${user.id}'),
                    icon: const Icon(Icons.delete),
                    onPressed: () => _confirmDelete(user),
                    visualDensity: VisualDensity.compact,
                    tooltip: 'Xoá',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String? _validateFullName(String? value) {
    final fullName = value?.trim() ?? '';

    if (fullName.isEmpty) {
      return 'Họ và tên không được để trống';
    }

    if (fullName.length < 2) {
      return 'Họ và tên tối thiểu 2 ký tự';
    }

    return null;
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    final emailPattern = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    );

    if (!emailPattern.hasMatch(email)) {
      return 'Email không đúng định dạng';
    }

    return null;
  }

  String? _validateAvatar(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng chọn ảnh đại diện';
    }

    return null;
  }

  Future<void> _handleSubmit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    final isEditing = _editingUser != null;
    final fullName = _fullNameController.text.trim();
    final email = _emailController.text.trim();
    final avatar = _avatarController.text.trim();

    try {
      final notifier = ref.read(
        userViewModelProvider.notifier,
      );

      if (isEditing) {
        await notifier.updateUser(
          _editingUser!.copyWith(
            fullName: fullName,
            email: email,
            avatar: avatar,
          ),
        );
      } else {
        await notifier.addUser(
          fullName: fullName,
          email: email,
          avatar: avatar,
        );
      }

      if (!mounted) {
        return;
      }

      _formKey.currentState?.reset();
      _fullNameController.clear();
      _emailController.clear();
      _avatarController.clear();

      setState(() {
        _editingUser = null;
      });

     
    } catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Không thể lưu người dùng: $error',
          ),
        ),
      );
    }
  }

  void _startEdit(UserModel user) {
    _formKey.currentState?.reset();

    _fullNameController.text = user.fullName;
    _emailController.text = user.email;
    _avatarController.text = user.avatar;

    setState(() {
      _editingUser = user;
    });
  }

  void _cancelEdit() {
    _formKey.currentState?.reset();

    _fullNameController.clear();
    _emailController.clear();
    _avatarController.clear();

    setState(() {
      _editingUser = null;
    });
  }

  Future<void> _confirmDelete(UserModel user) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          key: const Key('delete_confirm_dialog'),
          title: const Text('Xác nhận xoá'),
          content: Text(
            'Bạn có chắc muốn xoá ${user.fullName}?',
          ),
          actions: <Widget>[
            TextButton(
              key: const Key('btn_cancel_delete'),
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: const Text('Huỷ'),
            ),
            ElevatedButton(
              key: const Key('btn_confirm_delete'),
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: const Text('Xoá'),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true || !mounted) {
      return;
    }

    await ref
        .read(userViewModelProvider.notifier)
        .deleteUser(user.id);

    if (!mounted) {
      return;
    }

    if (_editingUser?.id == user.id) {
      _cancelEdit();
    }
  }

  void _openDetail(UserModel user) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => UserDetailScreen(user: user),
      ),
    );
  }
}