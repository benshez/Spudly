import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '/models/controllers/auth0/auth0_controller.dart';
import '/views/login_view.dart';
import '/views/profile_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class spudlyApp extends HookConsumerWidget {
  const spudlyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth0State = ref.watch(auth0NotifierProvider);
    useEffect(() {
      Future.microtask(() async {
        ref.watch(auth0NotifierProvider.notifier).initAction();
      });
      return;
    }, const []);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Auth0 state management"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: auth0State.isBusy
              ? const CircularProgressIndicator()
              : auth0State.isLoggedIn
                  ? const ProfileView()
                  : const LoginView(),
        ),
      ),
    );
  }
}
