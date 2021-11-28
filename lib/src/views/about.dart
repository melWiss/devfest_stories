import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_stories/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      Assets.assetsLogo,
                      width: 75,
                    ),
                  ),
                  Text(
                    "Devfest Stories",
                    style: Theme.of(context).textTheme.headline4,
                    softWrap: true,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Devfest Stories is an app that let Devfest Attenders share their best Devfest Memories with each others."),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      Assets.assetsMe,
                      width: 75,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("*Created by Oussama Maatallah."),
                        Text(
                            "*Co-founder and Software Developer at Make It Happen"),
                        Text("*Flutter Tunisia Co-Founder"),
                        Text("*EPI Sousse Software Engineering Student"),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Links",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: InkWell(
                        child: Image.asset(
                          Assets.assetsGithub,
                          width: MediaQuery.of(context).size.width * .25,
                          fit: BoxFit.fitWidth,
                        ),
                        onTap: () {
                          launch("https://github.com/melWiss/devfest_stories");
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: InkWell(
                        child: Image.asset(
                          Assets.assetsLinked,
                          width: MediaQuery.of(context).size.width * .25,
                          fit: BoxFit.fitWidth,
                        ),
                        onTap: () {
                          launch(
                              "https://www.linkedin.com/in/oussama-maatallah");
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: InkWell(
                        child: Image.asset(
                          Assets.assetsGmail,
                          width: MediaQuery.of(context).size.width * .25,
                          fit: BoxFit.fitWidth,
                        ),
                        onTap: () {
                          launch("mailto:oussamamaatallah01@gmail.com");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: InkWell(
                          child: Image.asset(
                            Assets.assetsFltTun,
                            width: MediaQuery.of(context).size.width * .25,
                            fit: BoxFit.fitWidth,
                          ),
                          onTap: () {
                            launch(
                                "https://join.slack.com/t/fluttertunisia/shared_invite/zt-z8a2q7wn-qyKj1vEGxZdA_gXHzLZq2A");
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: InkWell(
                          child: Image.asset(
                            Assets.assetsMih,
                            width: MediaQuery.of(context).size.width * .25,
                            fit: BoxFit.fitWidth,
                          ),
                          onTap: () {
                            launch("https://mih.tn");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
