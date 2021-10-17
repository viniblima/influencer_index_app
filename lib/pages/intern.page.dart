import 'package:flutter/material.dart';
import 'package:influencer_index_app/models/post.model.dart';

class InternScreen extends StatefulWidget {
  final Post? post;
  final int? indexHero;

  const InternScreen({
    Key? key,
    required this.indexHero,
    this.post,
  }) : super(key: key);

  @override
  _InternScreenState createState() => _InternScreenState();
}

class _InternScreenState extends State<InternScreen> {

  @override
  Widget build(BuildContext context) {
    const bannerHigh = 180.0;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: bannerHigh,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Hero(
                      tag: 'image_post_${widget.indexHero}',
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/mountains.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.post!.title ?? '',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto Condensed',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                '#000${widget.post?.id}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ),
                            Text(
                              'by Unknown',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF3C5B68),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Color(0xFFCCCCCC),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.post!.body ?? '',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato',
                            color: Color(0xFF6D6D6D),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
