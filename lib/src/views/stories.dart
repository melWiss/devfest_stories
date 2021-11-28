import 'package:devfest_stories/src/models/story.dart';
import 'package:devfest_stories/src/models/user.dart';
import 'package:devfest_stories/src/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoriesWidget extends StatelessWidget {
  const StoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     SvgPicture.network(
        //       user.imgUrl,
        //       height: 200,
        //       width: 200,
        //     ),
        //   ],
        // ),
        child: PageView.builder(
          itemCount: stories.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return StoryWidget(
              story: stories[index],
              user: users.firstWhere(
                  (element) => element.id! == stories[index].userID),
            );
          },
        ),
      ),
    );
  }
}
