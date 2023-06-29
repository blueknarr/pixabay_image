import 'package:flutter/material.dart';
import 'package:pixabay_image/data/pixabay.dart';
import 'package:pixabay_image/ui/search/search_view_model.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  Pixabay pixabay;
  DetailScreen({super.key, required this.pixabay});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('사진 상세보기'),
      ),
      body: Column(
        children: [
          Hero(
            tag: pixabay.id, //viewModel.images[viewModel.tagIndex].id,
            child: Image.network(
              pixabay.imgUrl, //viewModel.images[viewModel.tagIndex].imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text('1'),
        ],
      ),
    );
  }
}
