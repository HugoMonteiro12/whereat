import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_event_model.dart';
export 'create_event_model.dart';

class CreateEventWidget extends StatefulWidget {
  const CreateEventWidget({super.key});

  @override
  _CreateEventWidgetState createState() => _CreateEventWidgetState();
}

class _CreateEventWidgetState extends State<CreateEventWidget> {
  late CreateEventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateEventModel());

    _model.yourNameController1 ??= TextEditingController();
    _model.yourNameFocusNode1 ??= FocusNode();

    _model.locController ??= TextEditingController();
    _model.locFocusNode ??= FocusNode();

    _model.addressController ??= TextEditingController();
    _model.addressFocusNode ??= FocusNode();

    _model.yourNameController2 ??= TextEditingController();
    _model.yourNameFocusNode2 ??= FocusNode();
    _model.yourNameFocusNode2!.addListener(
      () async {
        await showModalBottomSheet<bool>(
            context: context,
            builder: (context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  minimumDate: getCurrentTimestamp,
                  initialDateTime: getCurrentTimestamp,
                  maximumDate: DateTime(2050),
                  use24hFormat: false,
                  onDateTimeChanged: (newDateTime) => safeSetState(() {
                    _model.datePicked = newDateTime;
                  }),
                ),
              );
            });
      },
    );
    _model.myBioController ??= TextEditingController();
    _model.myBioFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<EventsRecord>>(
      stream: queryEventsRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<EventsRecord> createEventEventsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final createEventEventsRecord = createEventEventsRecordList.isNotEmpty
            ? createEventEventsRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFFFF9900),
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Where@',
                style: GoogleFonts.getFont(
                  'Righteous',
                  color: const Color(0xFFFF9900),
                  fontSize: 34.0,
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 20.0),
                          child: Text(
                            'Create Event',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 12.0),
                        child: TextFormField(
                          controller: _model.yourNameController1,
                          focusNode: _model.yourNameFocusNode1,
                          autofillHints: const [AutofillHints.name],
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Event Name',
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            errorStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).error,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFF9900),
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
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 12.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.yourNameController1Validator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 12.0),
                        child: TextFormField(
                          controller: _model.locController,
                          focusNode: _model.locFocusNode,
                          autofillHints: const [AutofillHints.name],
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Location',
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            errorStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).error,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFF9900),
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
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 12.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.streetAddress,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.locControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 12.0),
                        child: TextFormField(
                          controller: _model.addressController,
                          focusNode: _model.addressFocusNode,
                          autofillHints: const [AutofillHints.name],
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Address',
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            errorStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).error,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFF9900),
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
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 12.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.streetAddress,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.addressControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 12.0),
                        child: TextFormField(
                          controller: _model.yourNameController2,
                          focusNode: _model.yourNameFocusNode2,
                          autofillHints: const [AutofillHints.name],
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Date',
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            errorStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).error,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFF9900),
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
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 12.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          keyboardType: TextInputType.datetime,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.yourNameController2Validator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 12.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(null),
                          options: const [
                            'Art',
                            'Sports',
                            'Technology',
                            'Business',
                            'Religious',
                            'Food'
                          ],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: double.infinity,
                          height: 44.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Category',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          elevation: 2.0,
                          borderColor: const Color(0xFFFF9900),
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 12.0),
                        child: TextFormField(
                          controller: _model.myBioController,
                          focusNode: _model.myBioFocusNode,
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: 'Short Description',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            errorStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).error,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFFF9900),
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
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 12.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          validator: _model.myBioControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 32.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final selectedMedia = await selectMedia(
                                maxWidth: 300.00,
                                maxHeight: 300.00,
                                mediaSource: MediaSource.photoGallery,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
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
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl = downloadUrls.first;
                                  });
                                } else {
                                  setState(() {});
                                  return;
                                }
                              }
                            },
                            text: 'Add Photo',
                            options: FFButtonOptions(
                              width: 130.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
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
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 24.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                // updateUserInfo

                                await EventsRecord.collection
                                    .doc()
                                    .set(createEventsRecordData(
                                      date: createEventEventsRecord?.date,
                                      name: createEventEventsRecord?.name,
                                      location:
                                          createEventEventsRecord?.location,
                                      description:
                                          createEventEventsRecord?.description,
                                      category:
                                          createEventEventsRecord?.category,
                                      address: createEventEventsRecord?.address,
                                      image: createEventEventsRecord?.image,
                                    ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Event has been created!',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                          ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                );
                                context.safePop();
                              },
                              text: 'Save Changes',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 44.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFFFF9900),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
