import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_application/app/domain/entities/driver.dart';
import 'package:my_flutter_application/app/presentation/blocs/chat/chat_bloc.dart';
import 'package:my_flutter_application/app/presentation/blocs/driver_recognition/driver_recognition_bloc.dart';
import 'package:my_flutter_application/app/presentation/page/camera_page.dart';
import 'package:my_flutter_application/app/presentation/page/chat_page.dart';
import 'package:my_flutter_application/app/presentation/page/driver_detail_page.dart';
import 'package:my_flutter_application/app/presentation/page/home_page.dart';
import 'package:my_flutter_application/app/presentation/page/navigation.dart';
import 'package:my_flutter_application/app/presentation/page/notification_page.dart';
import 'package:my_flutter_application/app/presentation/page/recognized_face_page.dart';
import 'package:my_flutter_application/app/presentation/page/report_page.dart';
import 'package:my_flutter_application/app/presentation/page/violation_page.dart';
import 'package:my_flutter_application/dependency_injection.dart';
import 'package:my_flutter_application/test/driver.dart';

class TrafficApp extends StatelessWidget {
  const TrafficApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      navigatorKey: GlobalKey<NavigatorState>(),
      routes: [
        // test route

        GoRoute(path: '/camera', builder: (context, state) => CameraScreen()),
        GoRoute(
            path: '/detail',
            builder: (context, state) {
              final driver = state.extra as DriverEntity;
              return DriverDetailsPage(
                driver: driver,
              );
            }),
        GoRoute(
            path: '/recognized',
            builder: (context, state) {
              final imageUrl = state.extra as String;
              return RecognizedFacePage(imageUrl: imageUrl);
            }),
        ShellRoute(
          builder: (context, state, child) {
            return HomeBottomBarNavigation(child: child);
          },
          routes: [
            GoRoute(path: '/', builder: (context, state) => HomePage()),
            GoRoute(path: '/report', builder: (context, state) => ReportPage()),
            GoRoute(
              path: '/notification',
              builder: (context, state) => NotificationPage(),
            ),
            GoRoute(path: '/chat', builder: (context, state) => ChatPage()),
          ],
        ),
        GoRoute(path: '/violation', builder: (context, state) => ViolationPage()),
      ],
    );
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MultiBlocProvider(
            providers: [
              BlocProvider<DriverRecognitionBloc>(
                  create: (context) => DriverRecognitionBloc(
                      identifyDriverUsecase: serviceLocator())),
                      BlocProvider<ChatBloc>(
                  create: (context) => ChatBloc(
                      sendQueryUsecase: serviceLocator())),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router,
            ),
          ),
        );
      },
    );
  }
}
