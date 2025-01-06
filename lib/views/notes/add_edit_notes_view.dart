import 'package:dsw51765/db/database.dart';
import 'package:dsw51765/utils/my_colors.dart';
import 'package:dsw51765/views/notes/notes_view.dart';
import 'package:dsw51765/views/widgets/notes_model.dart';
import 'package:flutter/material.dart';

class AddEditNoteView extends StatefulWidget {
  final Note? note;


  const AddEditNoteView({super.key, this.note});

  @override
  State<AddEditNoteView> createState() => _AddEditNoteViewState();
}

class _AddEditNoteViewState extends State<AddEditNoteView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final DataBaseHelper _dataBaseHelper = DataBaseHelper();
  late Color _selectedColor = MyColors.peachColor;
  final List<Color> _colors = [
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
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
      _selectedColor = Color(int.parse(widget.note!.color));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: ()=> Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          backgroundColor: MyColors.whiteColor,
          title: Text(widget.note == null ? 'Dodaj notatkę' : 'Edytuj notatkę'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: 'Tytuł',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Napisz tytuł';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _contentController,
                        decoration: InputDecoration(
                          hintText: 'Treść',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        maxLines: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Napisz treść';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _colors.map(
                                  (color) {
                                return GestureDetector(
                                  onTap: () =>
                                      setState(() => _selectedColor = color),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      color: color,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: _selectedColor == color
                                            ? MyColors.grayColor
                                            : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _saveNote();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NotesView(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: MyColors.lightColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Zapisz',
                              style: TextStyle(
                                color: MyColors.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
          
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveNote() async {
    if (_formKey.currentState!.validate()) {
      final note = Note(
        id: widget.note?.id,
        title: _titleController.text,
        content: _contentController.text,
        color: _selectedColor.value.toString(),
        dateTime: DateTime.now().toString(),
      );

      if(widget.note == null){
        await _dataBaseHelper.insertNote(note);
      }else{
        await _dataBaseHelper.updateNote(note);
      }
    }
  }
}
