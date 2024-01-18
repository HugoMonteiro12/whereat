import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "Image" field.
  List<String>? _image;
  List<String> get image => _image ?? const [];
  bool hasImage() => _image != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as String?;
    _description = snapshotData['description'] as String?;
    _category = snapshotData['Category'] as String?;
    _image = getDataList(snapshotData['Image']);
    _address = snapshotData['address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  DateTime? date,
  String? name,
  String? location,
  String? description,
  String? category,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'name': name,
      'location': location,
      'description': description,
      'Category': category,
      'address': address,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.description == e2?.description &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.image, e2?.image) &&
        e1?.address == e2?.address;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.name,
        e?.location,
        e?.description,
        e?.category,
        e?.image,
        e?.address
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
