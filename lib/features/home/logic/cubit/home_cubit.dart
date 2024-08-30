import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/logic/cubit/home_state.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/artical_model.dart';
import '../../data/models/sources_title_response.dart';
import '../../data/repos/home_repo.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial()) {
    emitGetSourcesTitle();
    emitGetArticals(selectedCategory,
        sourcesTitle.isNotEmpty ? sourcesTitle[0].id ?? "" : "");
  }

  List<String> categoryList = ["health", "business", "science", "technology"];

  int selectedCategory = 0;
  List<ArticalModel> articalsData = [];

  void emitGetArticals(int categoryIndex, String sourceName) async {
    articalsData = [];
    emit(const HomeState.articalsLoading());
    final response =
        await _homeRepo.getArticals(categoryList[categoryIndex], sourceName);
    response.when(success: (data) {
      articalsData = data;
      emit(HomeState.success(articalsData));
    }, failure: (error) {
      selectedCategory = 0;
      emit(HomeState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  List<SourcesTitle> sourcesTitle = [];

  void emitGetSourcesTitle() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getSoursesTitle();
    response.when(success: (data) {
      sourcesTitle = data;
      emit(HomeState.success(sourcesTitle));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void emitCategory(int cat) {
    selectedCategory = cat;
    emit(HomeState.success(cat));
  }

  String sourceName = "";
  void emitSelectedSource(int sourceIntex) {
    sourceName = sourcesTitle[sourceIntex].id ?? "";
  }

  int selectedIndex = 0;

  List<ArticalModel> searchedList = [];
  bool isSearching = false;
  TextEditingController controller = TextEditingController();

  void emitStartSearching() {
    emit(const HomeState.search());
    isSearching = true;
  }

  void emitStopSearching() {
    emit(const HomeState.stopSearch());
    isSearching = false;
    searchedList = [];
    controller.clear();
  }

  void emitSearching(String searchedCharacter) {
    searchedList = [];
    emit(const HomeState.articalsSearchedLoading());

    try {
      isSearching = true;
      searchedList = articalsData
          .where((artical) =>
              artical.title!.toLowerCase().startsWith(searchedCharacter))
          .toList();
      emit(const HomeState.search());
    } catch (message) {
      emit(HomeState.articalsSearchedError(error: message.toString()));
    }
  }

  String formatArticalDate(String inputDateString) {
    final articalTime = DateTime.parse(inputDateString);
    final now = DateTime.now();
    final difference = now.difference(articalTime);
    final formatedDate = timeago.format(now.subtract(difference));
    return formatedDate;
  }

  Future<void> launchingUrl(String inputUrl) async {
    final Uri url = Uri.parse(inputUrl);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
