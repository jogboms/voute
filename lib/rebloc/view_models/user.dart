import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:rebloc/rebloc.dart';
import 'package:voute/constants/mk_colors.dart';
import 'package:voute/models/user/user.dart';
import 'package:voute/rebloc/states/app.dart';
import 'package:voute/rebloc/states/user.dart';
import 'package:voute/utils/mk_typed_widget_builder.dart';
import 'package:voute/widgets/_partials/mk_loading_spinner.dart';

class UserViewModel extends Equatable {
  UserViewModel(AppState state)
      : model = state.user.user,
        isLoading = state.user.status == UserStatus.loading,
        hasError = state.user.status == UserStatus.failure,
        error = state.user.error,
        super(<AppState>[state]);

  factory UserViewModel.of(BuildContext context) => UserViewModel(StoreProvider.of<AppState>(context).states.value);

  final UserModel model;
  final bool isLoading;
  final bool hasError;
  final dynamic error;

  bool get isAvailable => !isLoading && model != null;

  static Widget build({@required MkTypedWidgetBuilder<UserViewModel> builder}) {
    return ViewModelSubscriber<AppState, UserViewModel>(
      converter: (AppState state) => UserViewModel(state),
      builder: (BuildContext context, DispatchFunction dispatcher, UserViewModel viewModel) {
        if (viewModel.isLoading || viewModel.model == null) {
          return MkLoadingSpinner(color: MkColors.smokey);
        }

        return builder(context, viewModel);
      },
    );
  }
}
