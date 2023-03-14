import 'package:charlykeleb/components/mouse_cursor.dart';
import 'package:charlykeleb/components/responsive_size.dart';
import 'package:charlykeleb/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:html' as html;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final portfolioKey = GlobalKey();
  final skillKey = GlobalKey();
  final aboutKey = GlobalKey();
  final serviceKey = GlobalKey();

  List menu = [
    {
      'title': 'About me',
      'section': '',
    },
    {
      'title': 'Portfolio',
      'section': '',
    },
    {
      'title': 'My Skills',
      'section': '',
    },
  ];

  List images = List.generate(5, (index) => "assets/images/${index + 1}.png");

  screenWidth() => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        largeScreen: ListView(
          children: <Widget>[
            _buildLargeTopSection(),
            _buildLargeAboutMeSection(),
            const SizedBox(
              height: 50.0,
            ),
            _buildLargePortfolioSection(),
            _buildLargeServicesSection(),
            _buildLargeSkillsSection(),
            const SizedBox(
              height: 50.0,
            ),
            _buildFooter(),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
        smallScreen: ListView(
          children: <Widget>[
            _buildSmallTopSection(),
            _buildSmallAboutMeSection(),
            const SizedBox(
              height: 50.0,
            ),
            _buildSmallPortfolioSection(),
            _buildSmallServicesSection(),
            _buildSmallSkillsSection(),
            const SizedBox(
              height: 50.0,
            ),
            _buildFooter(),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }

  _buildLargeTopSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${Constants.name}.',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Row(
                  children: <Widget>[
                    for (int i = 0; i < menu.length; i++)
                      _buildMenuText(menu[i]['title'])
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          _buildDivider(),
        ],
      ),
    );
  }

  _buildSmallTopSection() {
    return Column(
      children: <Widget>[
        AppBar(
          elevation: 0.0,
          title: Text(
            '${Constants.name}.',
            style: TextStyle(
              fontSize: 24.0,
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildDivider(),
        ),
      ],
    );
  }

  _buildDivider() {
    return Container(
      color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.4),
      width: MediaQuery.of(context).size.width,
      height: .2,
    );
  }

  _buildMenuText(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 50.0),
      child: MouseCursors(
        child: GestureDetector(
          onTap: () {
            if (text == "Portfolio") {
              Scrollable.ensureVisible(portfolioKey.currentContext!);
            } else if (text == 'My Skills') {
              Scrollable.ensureVisible(skillKey.currentContext!);
            } else {
              Scrollable.ensureVisible(aboutKey.currentContext!);
            }
          },
          child: Text(
            '$text',
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  _buildLargeAboutMeSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 130, right: 100),
      child: Column(
        key: aboutKey,
        children: <Widget>[
          const SizedBox(
            height: 50.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildAboutMe(),
              const SizedBox(
                width: 30.0,
              ),
              _buildProfilePicture(),
            ],
          ),
        ],
      ),
    );
  }

  _buildSmallAboutMeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 30.0,
          ),
          _buildSmallAboutMe(),
          const SizedBox(
            width: 10.0,
          ),
          _buildSmallProfilePicture(),
        ],
      ),
    );
  }

  _buildAboutMe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'HELLO, MY NAME IS',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          'Success Charles',
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "Success Charles is a Mobile Developer who has spent time\n"
              "working with Flutter. He gives back to the by contributing to\nOpen Source."
              "\nOn his free time, he learn new things, watch movies, play video games\nand also go Biking.",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall!.color,
            fontSize: 12.0,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Row(
          children: <Widget>[
            Container(
              height: 40.0,
              width: 100.0,
              child: MouseCursors(
                child: ElevatedButton(
                  onPressed: () => html.window.open(
                    "https://github.com/CharlyKeleb",
                    "CharlyKeleb Github",
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary),
                  ),
                  child: Text(
                    'My work'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Container(
              height: 40.0,
              width: 100.0,
              child: MouseCursors(
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 1,
                      ),
                    ),
                  ),
                  onPressed: () => html.window.open(
                    Constants.hireMe,
                    "Hire me",
                  ),
                  child: Text(
                    'Hire me'.toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildSmallAboutMe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'HELLO, MY NAME IS',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
          ),
        ),
//        SizedBox(height: 10.0,),
        const Text(
          'Success Charles',
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
//        SizedBox(height: 10.0,),
        Text(
          "Success Charles is a Mobile Developer who has spent time\n"
              "working with Flutter. He gives back to the by contributing\nto Open Source."
              "\nOn his free time, he learn new things, watch movies,\nPlay video games and also go Biking.",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall!.color,
            fontSize: 10.0,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Container(
              height: 40.0,
              width: 100.0,
              child: MouseCursors(
                child: ElevatedButton(
                  onPressed: () => html.window.open(
                    "https://github.com/CharlyKeleb",
                    "CharlyKeleb Github",
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary),
                  ),
                  child: Text(
                    'My work'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Container(
              height: 40.0,
              width: 100.0,
              child: MouseCursors(
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 1,
                      ),
                    ),
                  ),
                  onPressed: () => html.window.open(
                    Constants.hireMe,
                    "Hire me",
                  ),
                  child: Text(
                    'Hire me'.toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildProfilePicture() {
    return Stack(
      children: <Widget>[
        Container(
          height: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 520.0,
                height: 270.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 40.0,
          bottom: 40.0,
          child: Container(
            width: 250.0,
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Image.asset(
              "assets/images/person.png",
            ),
          ),
        ),
        Positioned(
          right: 40.0,
          bottom: 50.0,
          child: Container(
            height: 150.0,
            width: 150.0,
            child: GridView.builder(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Constants.social.length,
              itemBuilder: (BuildContext context, int index) {
                Map socialItem = Constants.social[index];
                return MouseCursors(
                  child: IconButton(
                    onPressed: () => html.window.open(
                      socialItem['link'],
                      "${socialItem['link']}",
                    ),
                    icon: Icon(
                      socialItem['icon'],
                      size: 45.0,
                      color: const Color(0xff414141),
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildSmallProfilePicture() {
    return Stack(
      children: <Widget>[
        Container(
          height: 250.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 400.0,
                height: 170.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20.0,
          bottom: 20.0,
          child: Container(
            width: 150.0,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Image.asset(
              "assets/images/person.png",
            ),
          ),
        ),
        Positioned(
          right: 30.0,
          bottom: 30.0,
          child: Container(
            height: 100.0,
            width: 100.0,
            child: GridView.builder(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Constants.social.length,
              itemBuilder: (BuildContext context, int index) {
                Map socialItem = Constants.social[index];
                return MouseCursors(
                  child: IconButton(
                    onPressed: () => html.window.open(
                      socialItem['link'],
                      "${socialItem['link']}",
                    ),
                    icon: Icon(
                      socialItem['icon'],
                      size: 35.0,
                      color: const Color(0xff414141),
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildLargePortfolioSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 110.0, right: 100.0),
      child: Column(
        key: portfolioKey,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Portfolio'.toUpperCase(),
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              width: 60.0,
              height: .5,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Below are some of my best works\n"
                  "Projects and Designs that are beautiful,inspiring and Slick!. ",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall!.color,
                fontSize: 12.0,
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: <Widget>[
              for (int i = 0; i < images.length; i++)
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: Image.asset(
                    "${images[i]}",
                    height: 250.0,
                    width: 270.0,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }

  _buildSmallPortfolioSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Portfolio'.toUpperCase(),
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.secondary,
            width: 60.0,
            height: .5,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Below are some of my best works\n"
                "Projects and Designs that are beautiful, inspiring and Slick!. ",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodySmall!.color,
              fontSize: 10.0,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: <Widget>[
              for (int i = 0; i < images.length; i++)
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: Image.asset(
                    "${images[i]}",
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }

  _buildLargeServicesSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 110.0, right: 100.0),
      child: Column(
        key: serviceKey,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Services'.toUpperCase(),
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              width: 60.0,
              height: .5,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Some of the services i provider are listed below;\n"
                  "Hire Me if you need something impeccable!. ",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall!.color,
                fontSize: 12.0,
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Wrap(
            spacing: 20.0,
            runSpacing: 10.0,
            children: <Widget>[
              for (int i = 0; i < Constants.services.length; i++)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: IconButton(
                        onPressed: () => html.window.open(
                          Constants.hireMe,
                          "Hire me",
                        ),
                        icon: Icon(
                          Constants.services[i]['icon'],
                          size: 50.0,
                          color: const Color(0xff414141),
                        ),
                      ),
                    ),
                    Text(
                      Constants.services[i]['title'],
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }

  _buildSmallServicesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Services'.toUpperCase(),
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.secondary,
            width: 60.0,
            height: .5,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Some of the services i provider are listed below;\n"
                "Hire Me if you need something impeccable!. ",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodySmall!.color,
              fontSize: 10.0,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Wrap(
            spacing: 20.0,
            runSpacing: 10.0,
            children: <Widget>[
              for (int i = 0; i < Constants.services.length; i++)
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: IconButton(
                          onPressed: () => html.window.open(
                            Constants.hireMe,
                            "Hire me",
                          ),
                          icon: Icon(
                            Constants.services[i]['icon'],
                            size: 35.0,
                            color: const Color(0xff414141),
                          ),
                        ),
                      ),
                      Text(
                        Constants.services[i]['title'],
                        style: const TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }

  _buildLargeSkillsSection() {
    return Container(
      key: skillKey,
      color: Colors.grey[100],
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 130.0, vertical: 80.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'My skills'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                width: 60,
                height: .2,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Here is the summary of some my proficient Skills\n"
                    "gathered over the past years. ",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall!.color,
                  fontSize: 12.0,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  for (int i = 0; i < Constants.skills.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 380.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "${Constants.skills[i]['title']}",
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "${Constants.skills[i]['value']} %",
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            LinearPercentIndicator(
                              width: 380.0,
                              lineHeight: 8.0,
                              barRadius: const Radius.circular(5),
                              percent: Constants.skills[i]['value'] / 100,
                              progressColor:
                              Theme.of(context).colorScheme.secondary,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSmallSkillsSection() {
    return Container(
      color: Colors.grey[100],
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'My skills'.toUpperCase(),
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            Container(
              color: Theme.of(context).colorScheme.secondary,
              width: 60,
              height: .2,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Here is the summary of some my proficient Skills\n"
                  "gathered over the past years. ",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
                fontSize: 10.0,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  for (int i = 0; i < Constants.skills.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "${Constants.skills[i]['title']}",
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    "${Constants.skills[i]['value']} %",
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 80.0,
                              lineHeight: 8.0,
                              percent: Constants.skills[i]['value'] / 100,
                              barRadius: const Radius.circular(5),
                              progressColor:
                              Theme.of(context).colorScheme.secondary,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildFooter() {
    return Center(
      child: Text(
        "${Constants.name} © ${DateTime.now().year} All Rights Reserved",
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 10.0,
        ),
      ),
    );
  }
}
