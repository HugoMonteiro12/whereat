import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'edit_profile_auth2_model.dart';
export 'edit_profile_auth2_model.dart';

class EditProfileAuth2Widget extends StatefulWidget {
  const EditProfileAuth2Widget({
    super.key,
    String? title,
    String? confirmButtonText,
    required this.navigateAction,
  })  : title = title ?? 'Edit Profile',
        confirmButtonText = confirmButtonText ?? 'Save Changes';

  final String title;
  final String confirmButtonText;
  final Future<dynamic> Function()? navigateAction;

  @override
  _EditProfileAuth2WidgetState createState() => _EditProfileAuth2WidgetState();
}

class _EditProfileAuth2WidgetState extends State<EditProfileAuth2Widget> {
  late EditProfileAuth2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileAuth2Model());

    _model.yourNameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.yourNameFocusNode ??= FocusNode();

    _model.myBioController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.shortDescription, ''));
    _model.myBioFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
            child: Text(
              widget.title,
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 0.0, 0.0),
            child: Text(
              'Adjust the content below to update your profile.',
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF9900), Color(0xFFECECEC)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60.0),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 200),
                            fadeOutDuration: const Duration(milliseconds: 200),
                            imageUrl: _model.uploadedFileUrl,
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                            memCacheWidth: 300,
                            memCacheHeight: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 32.0),
              child: FFButtonWidget(
                onPressed: () async {
                  final selectedMedia = await selectMedia(
                    maxWidth: 300.00,
                    maxHeight: 300.00,
                    mediaSource: MediaSource.photoGallery,
                    multiImage: false,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    setState(() => _model.isDataUploading = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];

                    var downloadUrls = <String>[];
                    try {
                      selectedUploadedFiles = selectedMedia
                          .map((m) => FFUploadedFile(
                                name: m.storagePath.split('/').last,
                                bytes: m.bytes,
                                height: m.dimensions?.height,
                                width: m.dimensions?.width,
                                blurHash: m.blurHash,
                              ))
                          .toList();

                      downloadUrls = (await Future.wait(
                        selectedMedia.map(
                          (m) async => await uploadData(m.storagePath, m.bytes),
                        ),
                      ))
                          .where((u) => u != null)
                          .map((u) => u!)
                          .toList();
                    } finally {
                      _model.isDataUploading = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      setState(() {
                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                        _model.uploadedFileUrl = downloadUrls.first;
                      });
                    } else {
                      setState(() {});
                      return;
                    }
                  }
                },
                text: 'Change Photo',
                options: FFButtonOptions(
                  width: 130.0,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium,
                  elevation: 1.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
            child: AuthUserStreamWidget(
              builder: (context) => TextFormField(
                controller: _model.yourNameController,
                focusNode: _model.yourNameFocusNode,
                autofillHints: const [AutofillHints.name],
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintText: 'Your full name...',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).error,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                cursorColor: FlutterFlowTheme.of(context).primary,
                validator:
                    _model.yourNameControllerValidator.asValidator(context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
            child: AuthUserStreamWidget(
              builder: (context) => TextFormField(
                controller: _model.myBioController,
                focusNode: _model.myBioFocusNode,
                textCapitalization: TextCapitalization.sentences,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Short Description',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                  hintText: 'A little about you...',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).error,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                textAlign: TextAlign.start,
                maxLines: 3,
                cursorColor: FlutterFlowTheme.of(context).primary,
                validator: _model.myBioControllerValidator.asValidator(context),
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    // updateUserInfo

                    await currentUserReference!.update(createUsersRecordData(
                      displayName: _model.yourNameController.text,
                      photoUrl: _model.uploadedFileUrl != ''
                          ? _model.uploadedFileUrl
                          : currentUserPhoto,
                      shortDescription: _model.myBioController.text,
                      lastActiveTime: getCurrentTimestamp,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Profile has been updated!',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                    await widget.navigateAction?.call();
                  },
                  text: widget.confirmButtonText,
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 44.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFFFF9900),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
