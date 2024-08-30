// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/colors.dart';
import 'package:news_app/features/home/ui/source_tab_item.dart';
import '../logic/cubit/home_cubit.dart';
import '../logic/cubit/home_state.dart';
import 'artical_item.dart';

class NewsScreen extends StatelessWidget {
  final int categoryModel;
  const NewsScreen({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
              child: CircularProgressIndicator(color: ColorsManager.lightBlue));
        }
        if (state is HomeError) {
          return Center(
            child: Text(state.error),
          );
        }

        return Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            DefaultTabController(
            
              animationDuration: const Duration(seconds: 5),
              initialIndex: context.read<HomeCubit>().selectedIndex,
              length: context.read<HomeCubit>().sourcesTitle.length,
              child: Column(
                children: [
                  TabBar(
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsets.symmetric(horizontal: 8.sp),
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    onTap: (index) {
                      context.read<HomeCubit>().searchedList = [];
                      context.read<HomeCubit>().controller.text = "";
                      context.read<HomeCubit>().selectedIndex = index;
                      context.read<HomeCubit>().emitSelectedSource(
                          context.read<HomeCubit>().selectedIndex);
                      context.read<HomeCubit>().emitGetArticals(
                          context.read<HomeCubit>().selectedIndex,
                          context.read<HomeCubit>().sourceName);
                    },
                    isScrollable: true,
                    tabs: context
                        .read<HomeCubit>()
                        .sourcesTitle
                        .map((item) => SourceTabItem(
                              isSelected: context
                                      .read<HomeCubit>()
                                      .sourcesTitle
                                      .indexOf(item) ==
                                  context.read<HomeCubit>().selectedIndex,
                              source: item,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocConsumer<HomeCubit, HomeState>(
              
              listener: (context, state) {},
              builder: (context, state) {
                
                if (state is HomeArticalsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.lightBlue,
                    ),
                  );
                }
                if (state is HomeArticalsSearchedLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                          color: ColorsManager.lightBlue));
                }

                if (state is HomeArticalsSearchedError) {
                  return Center(
                    child: Text(state.error),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return context
                                  .read<HomeCubit>()
                                  .controller
                                  .text
                                  .isEmpty
                              ? ArticalItem(
                                  articalModel: context
                                      .read<HomeCubit>()
                                      .articalsData[index])
                              : ArticalItem(
                                  articalModel: context
                                      .read<HomeCubit>()
                                      .searchedList[index]);
                        },
                        itemCount: context
                                .read<HomeCubit>()
                                .controller
                                .text
                                .isEmpty
                            ? context.read<HomeCubit>().articalsData.length
                            : context.read<HomeCubit>().searchedList.length),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
