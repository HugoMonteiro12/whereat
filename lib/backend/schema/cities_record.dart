import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CitiesRecord extends FirestoreRecord {
  CitiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _city = snapshotData['city'] as String?;
    _country = snapshotData['country'] as String?;
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Cities');

  static Stream<CitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitiesRecord.fromSnapshot(s));

  static Future<CitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitiesRecord.fromSnapshot(s));

  static CitiesRecord fromSnapshot(DocumentSnapshot snapshot) => CitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitiesRecordData({
  String? city,
  String? country,
  String? image,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city': city,
      'country': country,
      'image': image,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitiesRecordDocumentEquality implements Equality<CitiesRecord> {
  const CitiesRecordDocumentEquality();

  @override
  bool equals(CitiesRecord? e1, CitiesRecord? e2) {
    return e1?.city == e2?.city &&
        e1?.country == e2?.country &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description;
  }

  @override
  int hash(CitiesRecord? e) => const ListEquality()
      .hash([e?.city, e?.country, e?.image, e?.description]);

  @override
  bool isValidKey(Object? o) => o is CitiesRecord;
}
