import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
      stream: queryEventsRecord(),
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
        List<EventsRecord> homePageEventsRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            floatingActionButton: Visibility(
              visible: valueOrDefault<bool>(currentUserDocument?.admin, false),
              child: Align(
                alignment: const AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 65.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => FloatingActionButton(
                      onPressed: () async {
                        context.pushNamed('CreateEvent');
                      },
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBtnText,
                      elevation: 8.0,
                      child: const Icon(
                        Icons.add,
                        color: Color(0xFFFF9900),
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Text(
                  'Where@',
                  style: GoogleFonts.getFont(
                    'Righteous',
                    color: const Color(0xFFFF9900),
                    fontSize: 34.0,
                  ),
                ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -0.93),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hi ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFFFF9900),
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            TextSpan(
                              text: currentUserDisplayName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(
                              text: ',',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFFFF9900),
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Text(
                      'Explore the world around you',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).displayMedium.override(
                                fontFamily: 'Outfit',
                                color: const Color(0xFFFF9900),
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primaryBtnText,
                            const Color(0xFFFF9900)
                          ],
                          stops: const [0.0, 1.0],
                          begin: const AlignmentDirectional(0.0, -1.0),
                          end: const AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 70.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -0.6),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Upcoming Events',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Builder(
                                builder: (context) {
                                  final homePageVar =
                                      homePageEventsRecordList.toList();
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: homePageVar.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 5.0),
                                    itemBuilder: (context, homePageVarIndex) {
                                      final homePageVarItem =
                                          homePageVar[homePageVarIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            'Event',
                                            queryParameters: {
                                              'eventDetails': serializeParam(
                                                homePageVarItem.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.network(
                                                homePageVarItem.image,
                                                width: double.infinity,
                                                height: 180.0,
                                                fit: BoxFit.fill,
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 5.0, 0.0, 5.0),
                                                  child: Text(
                                                    homePageVarItem.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    homePageVarItem.location,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                  ),
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
