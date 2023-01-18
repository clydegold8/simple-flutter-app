import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/providers.dart';
import 'about_youtube_widget.dart';

class AboutYoutube extends ConsumerStatefulWidget {
  const AboutYoutube({super.key});

  @override
  AboutYoutubeState createState() => AboutYoutubeState();
}

class AboutYoutubeState extends ConsumerState<AboutYoutube> {

  @override
  void initState() {
    super.initState();
    ref.read(widgetPathProvider);
  }

  @override
  Widget build(BuildContext context) {
    return aboutYoutubeWidget(context, ref);
  }
}