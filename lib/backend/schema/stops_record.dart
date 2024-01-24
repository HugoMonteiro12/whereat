import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class StopsRecord extends FirestoreRecord {
  StopsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "stopTime" field.
  DateTime? _stopTime;
  DateTime? get stopTime => _stopTime;
  bool hasStopTime() => _stopTime != null;

  // "goTime" field.
  DateTime? _goTime;
  DateTime? get goTime => _goTime;
  bool hasGoTime() => _goTime != null;

  // "name" field.
  DocumentReference? _name;
  DocumentReference? get name => _name;
  bool hasName() => _name != null;

  // "city" field.
  DocumentReference? _city;
  DocumentReference? get city => _city;
  bool hasCity() => _city != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _location = snapshotData['location'] as LatLng?;
    _stopTime = snapshotData['stopTime'] as DateTime?;
    _goTime = snapshotData['goTime'] as DateTime?;
    _name = snapshotData['name'] as DocumentReference?;
    _city = snapshotData['city'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('stops')
          : FirebaseFirestore.instance.collectionGroup('stops');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('stops').doc();

  static Stream<StopsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StopsRecord.fromSnapshot(s));

  static Future<StopsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StopsRecord.fromSnapshot(s));

  static StopsRecord fromSnapshot(DocumentSnapshot snapshot) => StopsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StopsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StopsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StopsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StopsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStopsRecordData({
  LatLng? location,
  DateTime? stopTime,
  DateTime? goTime,
  DocumentReference? name,
  DocumentReference? city,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'stopTime': stopTime,
      'goTime': goTime,
      'name': name,
      'city': city,
    }.withoutNulls,
  );

  return firestoreData;
}

class StopsRecordDocumentEquality implements Equality<StopsRecord> {
  const StopsRecordDocumentEquality();

  @override
  bool equals(StopsRecord? e1, StopsRecord? e2) {
    return e1?.location == e2?.location &&
        e1?.stopTime == e2?.stopTime &&
        e1?.goTime == e2?.goTime &&
        e1?.name == e2?.name &&
        e1?.city == e2?.city;
  }

  @override
  int hash(StopsRecord? e) => const ListEquality()
      .hash([e?.location, e?.stopTime, e?.goTime, e?.name, e?.city]);

  @override
  bool isValidKey(Object? o) => o is StopsRecord;
}
