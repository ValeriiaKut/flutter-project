import 'package:dsw51765/db/database.dart';
import 'package:dsw51765/utils/my_colors.dart';
import 'package:dsw51765/views/login/login_view.dart';
import 'package:dsw51765/views/notes/add_edit_notes_view.dart';
import 'package:dsw51765/views/notes/note_view.dart';
import 'package:dsw51765/views/widgets/notes_model.dart';
import 'package:flutter/material.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  final DataBaseHelper _dataBaseHelper = DataBaseHelper();
  List<Note> _notes = [];
  final List<Color> _noteColors = [
    MyColors.peachColor,
    MyColors.blueColor,
    MyColors.pinkColor,
    MyColors.lemonColor,
    MyColors.coralColor,
    MyColors.petuniaColor,
    MyColors.greenColor,
  ];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await _dataBaseHelper.getNotes();
    setState(() {
      _notes = notes;
    });
  }

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
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.lightColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: MyColors.lightColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: _showLogOutDialog,
            icon: Icon(
              Icons.logout,
              color: MyColors.grayColor,
            ),
          ),

          title: const Text(
            'My Notes',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            final note = _notes[index];
            final color = Color(int.parse(note.color));

            return GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NoteView(note: note),
                  ),
                );
                await _loadNotes();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.grayColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(4, 4),
                    ),
                    BoxShadow(
                      color: MyColors.whiteColor.withOpacity(0.6),
                      blurRadius: 8,
                      offset: const Offset(-4, -4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyColors.blackColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      note.content,
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.blackColor,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      _formatDateTime(note.dateTime),
                      style: TextStyle(
                        fontSize: 12,
                        color: MyColors.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddEditNoteView(),
                ),);
            await _loadNotes();
          },
          backgroundColor: MyColors.coralColor,
          foregroundColor: MyColors.grayColor,
          child: const Icon(Icons.add_circle_outline_rounded),
        ),
      ),
    );
  }
  Future<void> _showLogOutDialog() async{
    final confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Wyloguj się',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.red,
          ),
        ),
        content: const Text(
          'Czy na pewno chcesz się wylogować?',
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
              'Wyloguj się',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    }
}
}




