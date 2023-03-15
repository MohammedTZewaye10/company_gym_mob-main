import 'package:flutter/material.dart';
import 'package:gym_app/constants.dart';
import 'package:gym_app/responsive.dart';

import '../../../../Utils/color.dart';
import '../../../../Widgets/big_text.dart';
import '../../../Services/api.dart';
import '../../../Widgets/spinkit.dart';
import '../../../Widgets/tap_to_retry.dart';
import 'carousel_slider_home.dart.dart';

import 'post_card.dart';

class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyHomeScreen> createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  List<dynamic> posts = [], ads = [];
  bool dataLoaded = false, failedToLoadData = false;
  String? nextPageUrl;
  final API api = API();
  final ScrollController controller = ScrollController();

  Future getData() async {
    final response = await api.postRequest(
      url: '${baseApiUrl}home/data/get',
    );

    if (response['code'] == 200) {
      ads = response['ads'];
      posts = response['posts']['data'];
      nextPageUrl = response['posts']['next_page_url'];
    } else {
      failedToLoadData = true;
    }

    setState(() {
      dataLoaded = true;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: BigText(
                  text: "Biy Boy",
                  color: AppColor.textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              !dataLoaded
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: const Center(
                        child: Spinkit(),
                      ),
                    )
                  : failedToLoadData
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Center(
                            child: TapToRetry(
                              message: 'Something went wrong, please try again',
                              onTap: () {
                                setState(() {
                                  failedToLoadData = false;
                                  dataLoaded = false;
                                });
                                getData();
                              },
                            ),
                          ),
                        )
                      : posts.isEmpty && ads.isEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: Center(
                                child: TapToRetry(
                                  message: 'Nothing Found',
                                  onTap: () {
                                    setState(() {
                                      failedToLoadData = false;
                                      dataLoaded = false;
                                    });
                                    getData();
                                  },
                                ),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ads.isEmpty
                                    ? const SizedBox()
                                    : HomeCarouselWidget(
                                        items: ads,
                                      ),
                                const SizedBox(height: 20),
                                posts.isEmpty
                                    ? const SizedBox()
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: BigText(
                                          text: "Posts",
                                          color: AppColor.textColor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                const SizedBox(height: 5),
                                Wrap(
                                  children: List.generate(
                                    posts.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(bottom: 20),
                                      child: PostCard(
                                        image: posts[index]['image_url'],
                                        desc: posts[index]['description'],
                                        video: posts[index]['video_url'],
                                        index: index,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
            ],
          ),
        ),
      ),
      notMobile: const Scaffold(),
    );
  }
}
