import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:zyntra/core/data/entities/article_entity.dart';
import 'package:zyntra/core/errors/failure.dart';
import 'package:zyntra/features/home/domain/use_cases/get_newest_articles_use_case.dart';

part 'get_newest_articles_state.dart';

class GetNewestArticlesCubit extends Cubit<GetNewestArticlesState> {
  final GetNewestArticlesUseCase useCase;

  List<ArticleEntity> articles = [];

  GetNewestArticlesCubit({required this.useCase})
    : super(GetNewestArticlesInitial());

  Future<void> getNewestArticles() async {
    // ✅ لو عندنا articles محفوظة، emit بيها فوراً من غير ما نكلم الـ API
    if (articles.isNotEmpty) {
      emit(GetNewestArticlesSuccess(articles: articles));
      return;
    }

    emit(GetNewestArticlesLoading());

    Either<Failure, List<ArticleEntity>> result = await useCase.call();
    result.fold(
      (failure) {
        emit(GetNewestArticlesFailure(message: failure.message));
      },
      (data) {
        articles = data;
        emit(GetNewestArticlesSuccess(articles: data));
      },
    );
  }
}
