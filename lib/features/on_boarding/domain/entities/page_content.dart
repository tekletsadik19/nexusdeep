import 'package:equatable/equatable.dart';
import 'package:nexusdeep/core/res/media_res.dart';
import 'package:nexusdeep/core/utils/constants.dart';

class PageContent extends Equatable{

  const PageContent({required this.image,required this.title,required this.description});
  const PageContent.first():this(
      image: MediaRes.onBoardingImg1,
      title: 'Connect Collaborate Create',
      description: 'Get ready to explore, connect, and innovate in the SSGI Net',
  );
  const PageContent.second():this(
    image: MediaRes.onBoardingImg2,
    title: '$kAppName\nIgnite Your Spark',
    description: 'Dive into a world of possibilities with '
        '$kAppName feature-rich platform.',
  );
  const PageContent.third():this(
    image: MediaRes.onBoardingImg3,
    title: 'Inspire Publish Innovate',
    description:'Share your insights through blogs, '
        'publish groundbreaking research',
  );
  final String image;
  final String title;
  final String description;


  @override
  List<Object?> get props => [image,title,description];
}