part of 'route.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        final prefs = sl<SharedPreferences>();
        if (prefs.getBool(kFirstTimerKey) ?? true) {
          return _pageBuilder(
            BlocProvider(
              create: (_) => sl<OnBoardingCubit>(),
              child: const OnBoardingScreen(),
            ),
            state,
          );
        } else if(prefs.getBool(kIsLoggedIn)??false){
          return _pageBuilder(
            const Dashboard(),
            state,
          );
        }
        return _pageBuilder(
          BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const SignInScreen(),
          ),
          state,
        );
      },

      routes:[


        GoRoute(
          path: 'forgot-password',
          pageBuilder: (context, state) {
            return _pageBuilder(
              BlocProvider(
                create: (_) => sl<AuthBloc>(),
                child: const ForgotPasswordScreen(),
              ),
              state,
            );
          },
        ),
        GoRoute(
          path: 'profile-screen',
          pageBuilder: (context, state) {
            return _pageBuilder(
              BlocProvider(
                create: (_) => sl<AuthBloc>(),
                child: const UserProfileScreen(),
              ),
              state,
            );
          },
        ),
        GoRoute(
          path: 'account-setting',
          pageBuilder: (context, state) {
            return _pageBuilder(
              const AccountSettingScreen(),
              state,
            );
          },
        ),
        GoRoute(
          path: 'notification-setting',
          pageBuilder: (context, state) {
            return _pageBuilder(
              const NotificationSettingScreen(),
              state,
            );
          },
        ),
        GoRoute(
          path: 'appearance-setting',
          pageBuilder: (context, state) {
            return _pageBuilder(
              const AppearanceSetting(),
              state,
            );
          },
        ),
        GoRoute(
          path: 'notification-screen',
          pageBuilder: (context, state) {
            return _pageBuilder(
              const NotificationScreen(),
              state,
            );
          },
        ),
        GoRoute(
          path: 'verify-email/:email',
          pageBuilder: (context, state) {
            final email = state.pathParameters['email'];
            final extra = state.extra as Map<String, dynamic>?;
            return _pageBuilder(
              BlocProvider(
                create: (_) => sl<AuthBloc>(),
                child: VerifyEmailScreen(
                  email: email,
                  name: extra!['name'] as String,
                  password: extra!['password'] as String,
                  token: extra!['token'] as String,
                ),
              ),
              state,
            );
          },
        ),
        GoRoute(
          path: 'signup-with-email',
          pageBuilder: (context, state) {
            return _pageBuilder(
              BlocProvider(
                create: (_) => sl<AuthBloc>(),
                child: const SignupWithEmailScreen(),
              ),
              state,
            );
          },
        ),
      ],
    ),

    GoRoute(
      path: SignInScreen.routeName,
      pageBuilder: (context, state) {
        return _pageBuilder(
          BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const SignInScreen(),
          ),
          state,
        );
      },
    ),
    GoRoute(
      path: SignupScreen.routeName,
      pageBuilder: (context, state) {
        return _pageBuilder(
          BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const SignupScreen(),
          ),
          state,
        );
      },
    ),


  ],
  redirect: (_, state) {

  },

);
CustomTransitionPage<dynamic> _pageBuilder(Widget page, GoRouterState state) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
      child: child,
    ),
  );
}


