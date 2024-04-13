import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:native_test/pages/home/cubit/cubit.dart';

class LoadedPage extends StatefulWidget {
  final String username;
  final List<String> books;
  const LoadedPage({
    required this.username,
    required this.books,
    super.key
  });

  @override
  State<LoadedPage> createState() => _LoadedPageState();
}

class _LoadedPageState extends State<LoadedPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) { 
    final homeContext = context.read<HomeCubit>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello, ${widget.username}!'),
          const SizedBox(height: 16),
          Form(
            key: formKey,
            child: TextFormField(
              controller: titleController,
              validator: (value) => switch (value != null) {
                true => null,
                false => 'Title is required',
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            )
          ),
          const SizedBox(height: 16),
          MaterialButton(
            onPressed: () {
              final title = titleController.text;

              if (formKey.currentState!.validate()) {
                homeContext.findBooks(title: title);
              }
            }, 
            color: Colors.blueAccent,
            textColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            child: const Text('Get Books')
          ),
          const SizedBox(height: 16),
          ...widget.books.map((book) => Text(book)),
          const SizedBox(height: 16),
          MaterialButton(
            onPressed: () => homeContext.goBack(), 
            color: Colors.blueAccent,
            textColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            child: const Text('Back')
          )
        ],
      ),
    );
  }
}