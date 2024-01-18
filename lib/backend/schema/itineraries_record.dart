import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItinerariesRecord extends FirestoreRecord {
  ItinerariesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "slogan" field.
  String? _slogan;
  String get slogan => _slogan ?? '';
  bool hasSlogan() => _slogan != null;

  // "Evaluation" field.
  double? _evaluation;
  double get evaluation => _evaluation ?? 0.0;
  bool hasEvaluation() => _evaluation != null;

  // "Durationdays" field.
  int? _durationdays;
  int get durationdays => _durationdays ?? 0;
  bool hasDurationdays() => _durationdays != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _slogan = snapshotData['slogan'] as String?;
    _evaluation = castToType<double>(snapshotData['Evaluation']);
    _durationdays = castToType<int>(snapshotData['Durationdays']);
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Itineraries');

  static Stream<ItinerariesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItinerariesRecord.fromSnapshot(s));

  static Future<ItinerariesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItinerariesRecord.fromSnapshot(s));

  static ItinerariesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItinerariesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItinerariesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItinerariesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItinerariesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItinerariesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItinerariesRecordData({
  String? title,
  String? description,
  String? slogan,
  double? evaluation,
  int? durationdays,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'slogan': slogan,
      'Evaluation': evaluation,
      'Durationdays': durationdays,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItinerariesRecordDocumentEquality implements Equality<ItinerariesRecord> {
  const ItinerariesRecordDocumentEquality();

  @override
  bool equals(ItinerariesRecord? e1, ItinerariesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.slogan == e2?.slogan &&
        e1?.evaluation == e2?.evaluation &&
        e1?.durationdays == e2?.durationdays &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ItinerariesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.slogan,
        e?.evaluation,
        e?.durationdays,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is ItinerariesRecord;
}
