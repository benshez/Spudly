import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spudly/controllers/auth0/auth0_controller.dart';

class ProfileView extends HookConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth0State = ref.watch(auth0NotifierProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 4),
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(auth0State.data!.user.pictureUrl.toString()),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('Name:  ${auth0State.data!.user.name}'),
        const SizedBox(height: 24),
        Text('Token:  ${auth0State.data!.accessToken}'),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: () async {
            ref.read(auth0NotifierProvider.notifier).logout();
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
