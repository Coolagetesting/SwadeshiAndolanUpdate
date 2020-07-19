import 'package:flutter/material.dart';
import 'package:swadeshiandolan/main.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrangeAccent,
      child: ClipRect(
        child: Flex(
            direction: context.isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              (english ? "Support In,\n" : "समर्थन करें\n")
                  .richText
                  .withTextSpanChildren([
                    (english
                            ? "Muhim Against China."
                            : "चीन के खिलाफ मुहीम में")
                        .textSpan
                        .green900
                        .make()
                  ])
                  .xl4
                  .white
                  .make(),
              20.widthBox,
              Expanded(
                  child: VxSwiper(
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                items: [
                  ProjectWidget(
                      title: english
                          ? "Ban Chinese Apps"
                          : "चाइनीज एप्स को बैन करें"),
                  ProjectWidget(
                      title: english
                          ? "Ban Chinese Products"
                          : "चीनी उत्पादों पर प्रतिबंध लगाएं"),
                  ProjectWidget(
                      title: english
                          ? "Say No Funds From China"
                          : "चीन से फंड न लें"),
                  ProjectWidget(
                      title: english
                          ? "Get Our Area Back"
                          : "चीन से हमारे क्षेत्र वापस लो"),
                  ProjectWidget(
                      title: english
                          ? "Stay Home Stay Safe"
                          : "घर में रहो,सुरक्षित रहो"),
                ],
                height: 180,
                viewportFraction: context.isMobile ? 0.75 : 0.4,
                autoPlay: true,
                autoPlayAnimationDuration: 1.seconds,
              ))
            ]).p64().h(context.isMobile ? 500 : 300),
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String title;

  const ProjectWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return title.text.bold.white.xl.wide.center
        .make()
        .box
        .p8
        .roundedLg
        .neumorphic(
            color: Colors.deepOrangeAccent, elevation: 5, curve: VxCurve.flat)
        .alignCenter
        .square(200)
        .make()
        .p16();
  }
}
