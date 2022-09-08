
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/common/dio/widget/http_error_boundary.dart';
import 'package:flutter_boilerplate/l10n/l10n.dart';
import 'package:flutter_boilerplate/modules/app/app.dart';
import 'package:flutter_boilerplate/modules/home/home.dart';
import 'package:macos_ui/macos_ui.dart';

class MacosAppView extends StatelessWidget {
  MacosAppView({super.key});

  final httpErrorBoundary = HttpErrorBoundary.init();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (BuildContext context, AppState state) => MacosApp(
        theme: MacosThemeData.light(),
        darkTheme: MacosThemeData.dark(),
        themeMode: state.themeMode,
        locale: state.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomePage(),
        builder: (BuildContext context, Widget? child) {
          final newChild = httpErrorBoundary(context, child);
          return newChild;
        },
      ),
    );
  }
}
