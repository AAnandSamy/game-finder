import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, GoogleAuthProvider;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:game_finder/firebase_options.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constants.dart';

User? get user {
  return FirebaseAuth.instance.currentUser;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(clientId: googleClientId),
  ]);

  runApp(const App());
}

final routerConfig = GoRouter(
  initialLocation: '/profile',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => SignInScreen(
        actions: [
          AuthStateChangeAction<SignedIn>(
            (context, _) => context.go('/profile'),
          ),
          AuthStateChangeAction<UserCreated>(
            (context, _) => context.go('/profile'),
          ),
        ],
      ),
      redirect: (context, _) => user != null ? '/profile' : null,
    ),
    GoRoute(
      path: '/profile',
      builder: (context, _) => ProfileScreen(
        actions: [SignedOutAction((context) => context.go('/login'))],
      ),
      redirect: (context, _) {
        if (user == null) return '/login';
        if (!user!.emailVerified) return '/verify-email';
        return null;
      },
    ),
    GoRoute(
      path: '/verify-email',
      builder: (context, state) => EmailVerificationScreen(
        actions: [
          EmailVerifiedAction(() => context.go('/profile')),
          AuthCancelledAction((context) async {
            await FirebaseUIAuth.signOut(context: context);
            context.go('/login');
          })
        ],
        headerBuilder: (context, constraints, shrinkOffset) {
          return Center(
            child: Icon(
              Icons.verified_outlined,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        },
        sideBuilder: (context, constraints) {
          return Icon(
            Icons.verified_outlined,
            size: 100,
            color: Theme.of(context).colorScheme.primary,
          );
        },
      ),
      redirect: (context, _) {
        if (user == null) return '/login';
        if (user!.emailVerified) return '/profile';
        return null;
      },
    ),
  ],
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Firebase UI with Go Router',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: routerConfig,
    );
  }
}
