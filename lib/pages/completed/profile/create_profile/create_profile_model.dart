import '/flutter_flow/flutter_flow_util.dart';
import '/pages/completed/profile/edit_profile_widget/edit_profile_widget_widget.dart';
import 'create_profile_widget.dart' show CreateProfileWidget;
import 'package:flutter/material.dart';

class CreateProfileModel extends FlutterFlowModel<CreateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for editProfile_widget component.
  late EditProfileWidgetModel editProfileWidgetModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    editProfileWidgetModel =
        createModel(context, () => EditProfileWidgetModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    editProfileWidgetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
