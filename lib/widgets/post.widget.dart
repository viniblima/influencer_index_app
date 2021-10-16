import 'package:flutter/material.dart';
import 'package:influencer_index_app/models/post.model.dart';

class PostWidget extends StatelessWidget {
  final Post? post;
  final bool isLoading;

  const PostWidget({
    Key? key,
    this.post,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isLoading) {
          return;
        }
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
            Container(
              constraints: BoxConstraints(
                maxHeight: 273,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Hero(
                  tag: 'image_post',
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/mountains.jpg'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
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
            Text(
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
            Container(
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
