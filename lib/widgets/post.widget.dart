import 'package:flutter/material.dart';
import 'package:influencer_index_app/models/post.model.dart';
import 'package:influencer_index_app/pages/intern.page.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class PostWidget extends StatelessWidget {
  final Post? post;
  final bool isLoading;
  final int? indexHero;

  const PostWidget({
    Key? key,
    this.post,
    this.indexHero,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isLoading) {
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InternScreen(
              post: post,
              indexHero: indexHero,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            const BoxShadow(
              color: Color.fromRGBO(151, 160, 204, 0.12),
              blurRadius: 1.0,
              spreadRadius: 0.5,
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isLoading
                ? Container(
                    height: 200,
                    child: Shimmer(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFCCCCCC),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Hero(
                        tag: 'image_post_$indexHero',
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/mountains.jpg'),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 16.0),
            isLoading
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        child: Shimmer(
                          child: Container(
                            color: Color(0xFFCCCCCC),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 20,
                        child: Shimmer(
                          child: Container(
                            color: Color(0xFFCCCCCC),
                          ),
                        ),
                      ),
                    ],
                  )
                : Text(
                    post?.title ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto Condensed',
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
            const SizedBox(height: 10.0),
            isLoading
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 14,
                        child: Shimmer(
                          child: Container(
                            color: Color(0xFFCCCCCC),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 14,
                        child: Shimmer(
                          child: Container(
                            color: Color(0xFFCCCCCC),
                          ),
                        ),
                      ),
                    ],
                  )
                : Text(
                    post?.body ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                      color: Color(0xFF6D6D6D),
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
            const SizedBox(height: 20.0),
            isLoading
                ? Container(
                    width: 50,
                    height: 20,
                    child: Shimmer(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    child: Text(
                      '#000${post?.id}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
