import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixabay_image/ui/search/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _keywordController = TextEditingController();

  @override
  void dispose() {
    _keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Pixabay 이미지 검색'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            TextField(
              controller: _keywordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: '키워드를 입력하세요',
                  fillColor: Colors.white70,
                  suffixIcon: IconButton(
                    onPressed: () async {
                      viewModel.images =
                          await viewModel.getImages(_keywordController.text);
                    },
                    icon: const Icon(Icons.search),
                  )),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: viewModel.images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: GestureDetector(
                      onTap: () {
                        viewModel.setTagIndex(index);
                        context.push('/detail', extra: viewModel.images[index]);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Hero(
                          tag: viewModel.images[index].id,
                          child: Image.network(
                            viewModel.images[index].imgUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                  // map으로 하면 안티 패턴(?)
                  // viewModel.images.map((image) {
                  //   return Image.network(
                  //     image.imgUrl,
                  //     fit: BoxFit.cover,
                  //   );
                  // });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
