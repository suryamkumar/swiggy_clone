import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/routes/app_router.dart';
import 'package:food/view_model/cubit/theme_cubit.dart';
import 'package:food/view_model/repository/product_repo.dart';
import 'bloc/product_bloc.dart';
import 'constant/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeModeCubit>(create: (_) => ThemeModeCubit()),
        BlocProvider<ProductBloc>(create: (_) => ProductBloc(ProductRepo())..add(FetchProducts())),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeMode>(
        builder: (context, themeMode) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getTheme(isDarkMode: false),
          darkTheme: AppTheme.getTheme(isDarkMode: true),
          themeMode: themeMode,
          routerConfig: AppRouter.config,
        ),
      ),
    );
  }
}
