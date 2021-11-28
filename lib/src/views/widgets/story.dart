import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:devfest_stories/src/models/story.dart';
import 'package:devfest_stories/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    Key? key,
    required this.story,
    required this.user,
    this.onLike,
  }) : super(key: key);
  final Story story;
  final User user;
  final Function()? onLike;

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned.fill(
          child: CachedNetworkImage(
            imageUrl: story.imgUrl!,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            onDoubleTap: onLike,
            child: Container(
              // height: mq.height,
              // width: mq.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.transparent,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
            ),
          ),
        ),
        Positioned(
          left: 8,
          bottom: 8,
          child: SizedBox(
            width: mq.width - 8,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            story.likes.contains(user.id)
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: story.likes.contains(user.id!)
                                ? Colors.red
                                : Colors.white,
                            size: 30,
                          ),
                          onPressed: onLike,
                        ),
                        Text(
                          story.likes.length.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Padding(
                //     padding: const EdgeInsets.all(4),
                //     child: IconButton(
                //       icon: Icon(
                //         Icons.comment,
                //         color: Colors.white,
                //         size: 30,
                //       ),
                //       onPressed: () {},
                //     ),
                //   ),
                // ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Padding(
                //     padding: const EdgeInsets.all(4),
                //     child: IconButton(
                //       icon: Icon(
                //         Icons.share,
                //         color: Colors.white,
                //         size: 30,
                //       ),
                //       onPressed: () {},
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.yellow,
                      ),
                      label: Text(
                        "Add a Story",
                        style: TextStyle(color: Colors.black),
                      ),
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipOval(
                        child: SvgPicture.network(
                          user.imgUrl,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user.fullName} @ ${formatDate(story.date!, [
                                    H,
                                    ':',
                                    nn
                                  ])}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              story.text!,
                              style: const TextStyle(color: Colors.white),
                              softWrap: true,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
