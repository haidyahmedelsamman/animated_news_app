import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/logic/cubit/home_cubit.dart';
import 'package:news_app/features/home/logic/cubit/home_state.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current is HomeLoading ||
          current is HomeSuccess ||
          current is HomeSearch ||
          current is HomeStopSearch ||
          current is HomeError,
      listener: (context, state) {},
      builder: (context, state) {
        return TextFormField(
          controller: context.read<HomeCubit>().controller,
          onChanged: (value) {
            if (value.isEmpty) {
              context.read<HomeCubit>().emitStopSearching();
            }
            context.read<HomeCubit>().emitSearching(value);
            context.read<HomeCubit>().emitStartSearching();
          },
          style: TextStyles.font14GreenRegular,
          cursorHeight: 20,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            prefixIcon: AnimatedOpacity(
              opacity: context.read<HomeCubit>().isSearching ? 1.0 : 0.0,
              duration: const Duration(seconds: 3),
              curve: Curves.bounceInOut,
              child: IconButton(
                onPressed: () {
                  context.read<HomeCubit>().emitStopSearching();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            prefixIconColor: ColorsManager.lightBlue,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        );
      },
    );
  }
}
