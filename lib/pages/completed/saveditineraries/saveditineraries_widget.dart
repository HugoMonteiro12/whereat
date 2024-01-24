import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'saveditineraries_model.dart';
export 'saveditineraries_model.dart';

class SaveditinerariesWidget extends StatefulWidget {
  const SaveditinerariesWidget({super.key});

  @override
  _SaveditinerariesWidgetState createState() => _SaveditinerariesWidgetState();
}

class _SaveditinerariesWidgetState extends State<SaveditinerariesWidget> {
  late SaveditinerariesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SaveditinerariesModel());
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

    return StreamBuilder<List<ItinerariesRecord>>(
      stream: queryItinerariesRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<ItinerariesRecord> saveditinerariesItinerariesRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
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
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Saved itineraries',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: const Icon(
                              Icons.tune_rounded,
                              color: Color(0xFFFF9900),
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final savedItineraries =
                            saveditinerariesItinerariesRecordList.toList();
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: savedItineraries.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                          itemBuilder: (context, savedItinerariesIndex) {
                            final savedItinerariesItem =
                                savedItineraries[savedItinerariesIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'Itinerary',
                                  queryParameters: {
                                    'itinerary': serializeParam(
                                      savedItinerariesItem.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Hero(
                                      tag: savedItinerariesItem.image,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          savedItinerariesItem.image,
                                          width: double.infinity,
                                          height: 200.0,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 10.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            savedItinerariesItem.title,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: savedItinerariesItem
                                                      .durationdays
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                const TextSpan(
                                                  text: ' days',
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              savedItinerariesItem.slogan,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 4.0, 0.0),
                                            child: Text(
                                              savedItinerariesItem.evaluation
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                          ),
                                          Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
