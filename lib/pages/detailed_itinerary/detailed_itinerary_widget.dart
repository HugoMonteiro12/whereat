import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'detailed_itinerary_model.dart';
export 'detailed_itinerary_model.dart';

class DetailedItineraryWidget extends StatefulWidget {
  const DetailedItineraryWidget({super.key});

  @override
  _DetailedItineraryWidgetState createState() =>
      _DetailedItineraryWidgetState();
}

class _DetailedItineraryWidgetState extends State<DetailedItineraryWidget> {
  late DetailedItineraryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailedItineraryModel());
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Text(
                    'Day 1',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Outfit',
                          fontSize: 34.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 40.0),
                          child: PageView(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.vertical,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.9),
                                      child: Text(
                                        '10:00 - 12:30',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.35),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 25.0, 25.0, 25.0),
                                        child: Text(
                                          'Start at Puerta del Sol, a bustling square. Visit Madrid\'s iconic statue, the Bear and the Strawberry Tree, and the Kilometer Zero marker.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-0.02, -0.73),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          'Puerta del Sol & Bear and Strawberry Tree',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displayMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 34.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.5),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/f_i_pg_111009_puerta_sol_-1.jpg',
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.9),
                                      child: Text(
                                        '12:30 - 14:00',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.5),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 25.0, 25.0, 25.0),
                                        child: Text(
                                          'Head to Mercado de San Miguel for a diverse array of Spanish cuisine. Try tapas, fresh seafood, and local delicacies.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-0.02, -0.73),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          'Mercado de San Miguel',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displayMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 34.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/PXL_20230819_210858124.jpg',
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.4,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.9),
                                      child: Text(
                                        '14:00 - 16:00',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.35),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 25.0, 25.0, 25.0),
                                        child: Text(
                                          'Explore the Royal Palace of Madrid. Marvel at its grandeur, the lavish interiors, and the beautiful Sabatini Gardens.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-0.02, -0.73),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          'Royal Palace of Madrid',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displayMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 34.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.55),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/WhatsApp_Image_2023-12-27_at_17.32.44.jpeg',
                                          width: 306.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.9),
                                      child: Text(
                                        '14:00 - 16:00',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.35),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 25.0, 25.0, 25.0),
                                        child: Text(
                                          'Explore the Royal Palace of Madrid. Marvel at its grandeur, the lavish interiors, and the beautiful Sabatini Gardens.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-0.02, -0.73),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          'Royal Palace of Madrid',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displayMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 34.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.5),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://picsum.photos/seed/413/600',
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.9),
                                      child: Text(
                                        '14:00 - 16:00',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.35),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            25.0, 25.0, 25.0, 25.0),
                                        child: Text(
                                          'Explore the Royal Palace of Madrid. Marvel at its grandeur, the lavish interiors, and the beautiful Sabatini Gardens.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-0.02, -0.73),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          'Royal Palace of Madrid',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displayMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 34.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.5),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://picsum.photos/seed/413/600',
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 40.0, 0.0, 16.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              count: 5,
                              axisDirection: Axis.vertical,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 3.0,
                                spacing: 8.0,
                                radius: 16.0,
                                dotWidth: 16.0,
                                dotHeight: 8.0,
                                dotColor: FlutterFlowTheme.of(context).accent1,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
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
  }
}
