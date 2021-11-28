import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_stories/src/models/story.dart';
import 'package:devfest_stories/src/models/user.dart';
import 'package:devfest_stories/src/views/settings.dart';
import 'package:devfest_stories/src/views/widgets/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: SvgPicture.network(
                  user.imgUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                user.fullName!,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Stories",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: userStories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        child: CachedNetworkImage(
                          imageUrl: userStories[index].imgUrl!,
                          fit: BoxFit.fitWidth,
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return Scaffold(
                                body: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: StoryWidget(
                                          story: userStories[index],
                                          user: user),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context)
                                              .viewPadding
                                              .top +
                                          12,
                                      left: 12,
                                      child: ClipOval(
                                        child: Container(
                                          color: Colors.black87,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back,
                                              color: Colors.white,
                                            ),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ));
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Settings"),
        icon: Icon(Icons.settings),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return SettingsWidget();
            },
          ));
        },
      ),
    );
  }
}
