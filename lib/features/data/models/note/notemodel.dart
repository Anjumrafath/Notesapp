import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notesapp/features/domain/entities/note/noteentity.dart';

class NoteModel extends NoteEntity {
  NoteModel({
    final String? noteId,
    final String? note,
    final Timestamp? time,
    final String? uid,
  }) : super(uid: uid, time: time, note: note, noteId: noteId);
  factory NoteModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return NoteModel(
      noteId: documentSnapshot.get('noteId'),
      note: documentSnapshot.get('note'),
      uid: documentSnapshot.get('uid'),
      time: documentSnapshot.get('time'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {"uid": uid, "time": time, "note": note, "noteId": noteId};
  }
}
