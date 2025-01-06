import 'package:dsw51765/db/database.dart';
import 'package:dsw51765/utils/my_colors.dart';
import 'package:dsw51765/views/notes/add_edit_notes_view.dart';
import 'package:dsw51765/views/widgets/notes_model.dart';
import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  final Note note;

  NoteView({required this.note, super.key});

  final DataBaseHelper _dataBaseHelper = DataBaseHelper();

  String _formatDateTime(String dateTime) {
    final dt = DateTime.parse(dateTime);
    final now = DateTime.now();

    if (dt.year == now.year && dt.month == now.month && dt.day == now.day) {
      return 'Dzisiaj, ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    }
    return '${dt.day}/${dt.month}/${dt.year}, ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(int.parse(note.color)),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: ()=> Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: MyColors.grayColor,
              ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditNoteView(
                      note: note,
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.edit_outlined,
                color: MyColors.grayColor,
              ),
            ),
            IconButton(
              onPressed: () => _showDeleteDialog(context),
              icon: Icon(
                Icons.delete,
                color: MyColors.grayColor,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 16,
                            color: MyColors.grayColor,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                            Text(
                              _formatDateTime(
                                note.dateTime,
                              ),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                      decoration: BoxDecoration(
                        color: MyColors.granyColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                          child: Text(
                            note.content,
                            style:  TextStyle(
                              fontSize: 16,
                              color: MyColors.blackColor.withOpacity(0.8),
                              height: 1.6,
                              letterSpacing: 0.2,
                            ),
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

  Future<void> _showDeleteDialog(BuildContext context) async{
    final confirm = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Usuń notatkę',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.red,
            ),
          ),
          content: const Text(
            'Czy na pewno chcesz usunąć notatkę?',
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'Anuluj',
                  style: TextStyle(
                    color: MyColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text(
                'Usuń',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
    );
    if (confirm == true){
      await _dataBaseHelper.deleteNote(note.id!);
      Navigator.pop(context);
    }
  }
}
