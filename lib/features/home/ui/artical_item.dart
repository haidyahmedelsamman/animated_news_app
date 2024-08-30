// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/extentions.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/core/theme/styles.dart';
import 'package:news_app/features/home/logic/cubit/home_cubit.dart';
import 'package:news_app/features/home/logic/cubit/home_state.dart';
import '../../../core/theme/colors.dart';
import '../data/models/artical_model.dart';

class ArticalItem extends StatelessWidget {
  final ArticalModel articalModel;
  const ArticalItem({
    super.key,
    required this.articalModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.pushNamed(Routes.articalDetailsScreen,
              arguments: articalModel),
          child: AnimatedPositioned(
            duration: const Duration(seconds: 3),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: articalModel.urlToImage ?? articalModel.hashCode,
                    child: CachedNetworkImage(
                      height: 200.h,
                      imageUrl: articalModel.urlToImage ?? "",
                      placeholder: (context, url) =>
                         const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.lightBlue,
                    ),
                  ),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
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
                    height: 8.h,
                  ),
                  Text(articalModel.author ?? ""),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    articalModel.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyles.font16BlackMedium,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    context
                        .read<HomeCubit>()
                        .formatArticalDate(articalModel.publishedAt ?? ""),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
