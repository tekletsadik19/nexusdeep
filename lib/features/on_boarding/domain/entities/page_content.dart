import 'package:equatable/equatable.dart';
import 'package:nexusdeep/core/res/media_res.dart';
import 'package:nexusdeep/core/utils/constants.dart';

class PageContent extends Equatable{

  const PageContent({required this.image,required this.title,required this.description});
  const PageContent.first():this(
      image: MediaRes.onBoardingImg1,
      title: 'Invest with complete confidence',
      description: 'Accelerate your growth with Nexus Deep Investment options '
          'integrated directly with your account'
      ,
  );
  const PageContent.second():this(
    image: MediaRes.onBoardingImg2,
    title: 'Speed without compromise',
    description: 'Efficiently manage your investment operation from a single dashboard with '
        '$kAppName feature-rich platform.',
  );
  const PageContent.third():this(
    image: MediaRes.onBoardingImg3,
    title: 'Innovation that doesn\’t sacrifice security',
    description:'Nexus Deep built for entrepreneurs, by entrepreneurs',
  );
  final String image;
  final String title;
  final String description;


  @override
  List<Object?> get props => [image,title,description];
}
