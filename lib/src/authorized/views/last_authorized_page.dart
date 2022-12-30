import 'package:cima_client/l10n/l10n.dart';
import 'package:cima_client/src/search_result/search_result.dart';
import 'package:cima_repository/cima_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastAuthorizedPage extends StatelessWidget {
  const LastAuthorizedPage({super.key});

  static Page<void> get page =>
      const MaterialPage<void>(child: LastAuthorizedPage());

  Map<String, String> get _paramsSearch => {'autorizados': '1'};

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider(
      create: (context) => SearchMedicationResultBloc(
        cimaRepository: context.read<CimaRepository>(),
      )..add(Search(params: _paramsSearch)),
      child: SearchResultView(title: l10n.recently_authorized),
    );
  }
}
