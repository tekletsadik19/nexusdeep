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
        } else{
          return _pageBuilder(
            BlocProvider(
              create: (_) => sl<AuthBloc>(),
              child: const SignInScreen(),
            ),
            state,
          );
        }
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
          path: 'verify-email/:email',
          pageBuilder: (context, state) {
            final email = state.pathParameters['email'];
            return _pageBuilder(
              BlocProvider(
                create: (_) => sl<AuthBloc>(),
                child: VerifyEmailScreen(email: email),
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
          const SignupScreen(),
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


