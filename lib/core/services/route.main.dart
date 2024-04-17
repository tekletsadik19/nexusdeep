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
            const SignupScreen(),
            state,
          );
        }
      },

      routes:[
        GoRoute(
          path: 'forgot-password',
          pageBuilder: (context, state) {
            return _pageBuilder(
              const ForgotPasswordScreen(),
              state,
            );
          },
        ),
        GoRoute(
          path: 'signup-with-email',
          pageBuilder: (context, state) {
            return _pageBuilder(
              const SignupWithEmailScreen(),
              state,
            );
          },
        ),
      ],
    ),

    GoRoute(
      path: SigninScreen.routeName,
      pageBuilder: (context, state) {
        return _pageBuilder(
          const SigninScreen(),
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

