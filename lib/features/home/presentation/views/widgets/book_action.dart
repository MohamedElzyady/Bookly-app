import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/shared/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookAction extends StatefulWidget {
  const BookAction({super.key, required this.book});
  final BookModel book;

  @override
  State<BookAction> createState() => _BookActionState();
}

class _BookActionState extends State<BookAction> {
  Future<void> _launcher() async {
    final previewLink = widget.book.volumeInfo.previewLink;
    if (previewLink == null || previewLink.isEmpty) {
      return;
    }
    final Uri uri = Uri.parse(previewLink);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

  String getText(BookModel book) {
    if (book.volumeInfo.previewLink == null) {
      return 'Not Avalible';
    } else {
      return 'Free Preview';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButtom(
              text: '19.99€',
              backgroundcolor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButtom(
              onPressed: _launcher,
              text: getText(widget.book),
              backgroundcolor: const Color.fromARGB(255, 239, 98, 55),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
