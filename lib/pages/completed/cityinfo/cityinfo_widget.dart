import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cityinfo_model.dart';
export 'cityinfo_model.dart';

class CityinfoWidget extends StatefulWidget {
  const CityinfoWidget({
    super.key,
    required this.city,
  });

  final DocumentReference? city;

  @override
  _CityinfoWidgetState createState() => _CityinfoWidgetState();
}

class _CityinfoWidgetState extends State<CityinfoWidget> {
  late CityinfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CityinfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<CitiesRecord>(
        stream: CitiesRecord.getDocument(widget.city!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          final profileCardCitiesRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxWidth: 700.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xBFFFFFFF),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 12.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 5.0),
                )
              ],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  profileCardCitiesRecord.city,
                                  'City',
                                ),
                                style:
                                    FlutterFlowTheme.of(context).headlineLarge,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    profileCardCitiesRecord.country,
                                    'Country',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 44.0,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        profileCardCitiesRecord.image,
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        profileCardCitiesRecord.description,
                        'Description',
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
