// views/news_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_z/modules/news/controllers/bloc/c_news_bloc.dart';
import 'package:news_z/modules/news/controllers/bloc/c_news_event.dart';
import 'package:news_z/modules/news/data/models/m_news.dart';

class NewsForm extends StatefulWidget {
  final News? news;
  final bool isEditing;

  NewsForm({this.news, this.isEditing = false});

  @override
  _NewsFormState createState() => _NewsFormState();
}

class _NewsFormState extends State<NewsForm> {
  final _formKey = GlobalKey<FormState>();
  late int _id;
  late String _title;
  late String _description;
  late DateTime _date;
  late String _imageUrl;
  late int _categoryId;

  @override
  void initState() {
    super.initState();
    if (widget.isEditing && widget.news != null) {
      _id = widget.news!.id;
      _title = widget.news!.titulo;
      _description = widget.news!.descripcion;
      _date = widget.news!.fecha;
      _imageUrl = widget.news!.imagen!;
      _categoryId = widget.news!.categoriaId;
    } else {
      _id = 0;
      _title = '';
      _description = '';
      _date = DateTime.now();
      _imageUrl = '';
      _categoryId = 0;
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final news = News(
        id: _id,
        titulo: _title,
        descripcion: _description,
        fecha: _date,
        imagen: _imageUrl,
        categoriaId: _categoryId,
      );
      if (widget.isEditing) {
        context.read<NewsBloc>().add(EditNews(news));
      } else {
        context.read<NewsBloc>().add(CreateNews(news));
      }
      Navigator.of(context).pop(); // Cierra el formulario después de guardar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Editar Noticia' : 'Agregar Noticia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese un título';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                initialValue: _description,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese una descripción';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                initialValue: _imageUrl,
                decoration:
                    const InputDecoration(labelText: 'URL de la Imagen'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la URL de la imagen';
                  }
                  return null;
                },
                onSaved: (value) {
                  _imageUrl = value!;
                },
              ),
              DropdownButtonFormField<int>(
                value: _categoryId,
                decoration: const InputDecoration(labelText: 'Categoría'),
                items: const [
                  DropdownMenuItem(value: 0, child: Text('Viajes')),
                  DropdownMenuItem(value: 1, child: Text('Videojuegos')),
                  DropdownMenuItem(value: 2, child: Text('Cine')),
                ],
                onChanged: (value) {
                  setState(() {
                    _categoryId = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text(
                    widget.isEditing ? 'Guardar Cambios' : 'Agregar Noticia'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
