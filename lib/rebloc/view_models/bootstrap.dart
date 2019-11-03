import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rebloc/rebloc.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/models/config.dart';
import 'package:voute/rebloc/states/app.dart';
import 'package:voute/rebloc/states/bootstrap.dart';
import 'package:voute/utils/mk_typed_widget_builder.dart';
import 'package:voute/widgets/_partials/mk_loading_spinner.dart';

class BootstrapViewModel extends Equatable {
  BootstrapViewModel(AppState state)
      : config = state.bootstrap.config,
        isLoading = state.bootstrap.status == BootstrapStatus.loading,
        hasError = state.bootstrap.status == BootstrapStatus.failure,
        error = state.bootstrap.error;

  final ConfigModel config;
  final bool isLoading;
  final bool hasError;
  final dynamic error;

  static Widget build({@required MkTypedWidgetBuilder<BootstrapViewModel> builder}) {
    return ViewModelSubscriber<AppState, BootstrapViewModel>(
      converter: (AppState state) => BootstrapViewModel(state),
      builder: (BuildContext context, DispatchFunction dispatcher, BootstrapViewModel viewModel) {
        if (viewModel.isLoading || viewModel.config == null) {
          return MkLoadingSpinner(color: MkColors.smokey);
        }

        return builder(context, viewModel);
      },
    );
  }

  @override
  List<Object> get props => [config, isLoading, hasError, error];
}
