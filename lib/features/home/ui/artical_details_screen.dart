import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/data/models/artical_model.dart';
import 'package:news_app/features/home/logic/cubit/home_cubit.dart';
import 'package:news_app/features/home/logic/cubit/home_state.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';

class ArticalDetailsScreen extends StatelessWidget {
  const ArticalDetailsScreen({super.key, required this.artical});
  final ArticalModel artical;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/images/pattern.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 70.h,
              centerTitle: true,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: ColorsManager.lightBlue,
              title: Text(
                "Artical Details",
                style: TextStyles.font20WhiteRegular,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
              ),
            ),
            body: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.sp, horizontal: 10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Hero(
                        tag: artical.urlToImage ?? artical.hashCode,
                        child: CachedNetworkImage(
                          height: 200.h,
                          imageUrl: artical.urlToImage ?? "",
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Center(child: Icon(Icons.error)),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        artical.author ?? "",
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        artical.title ?? "",
                        style: TextStyles.font16BlackMedium,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        context
                            .read<HomeCubit>()
                            .formatArticalDate(artical.publishedAt ?? ""),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 30,
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(1, 2))
                            ]),
                        child: Text(
                          artical.content ?? "",
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<HomeCubit>()
                              .launchingUrl(artical.url ?? "");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "View Full Artical",
                              style: TextStyles.font16BlackMedium,
                              textAlign: TextAlign.end,
                            ),
                            const Icon(
                              Icons.arrow_right_outlined,
                              size: 40,
                              weight: 10,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )),
      ],
    );
  }
}
