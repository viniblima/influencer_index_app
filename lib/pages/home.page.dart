import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:influencer_index_app/store/posts.store.dart';
import 'package:influencer_index_app/widgets/post.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  final PostsStore _postsStore = PostsStore();

  initPage() {
    _postsStore.loadPosts();
  }

  @override
  void initState() {
    initPage();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: RefreshIndicator(
        onRefresh: () async {
          initPage();
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const SliverAppBar(
              title: Text(
                'List of Posts',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 37,
                  fontFamily: 'Roboto Condensed',
                ),
              ),
              backgroundColor: Colors.transparent,
              floating: false,
              expandedHeight: 80,
            ),
            Observer(
              builder: (_) => _postsStore.isLoading
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: 20,
                              left: 16,
                              right: 16,
                            ),
                            child: PostWidget(
                              isLoading: _postsStore.isLoading,
                            ),
                          );
                        },
                        childCount: 3,
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: 20,
                              left: 16,
                              right: 16,
                            ),
                            child: PostWidget(
                              isLoading: _postsStore.isLoading,
                              post: _postsStore.posts[index],
                              indexHero: index,
                            ),
                          );
                        },
                        childCount: _postsStore.posts.length,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
