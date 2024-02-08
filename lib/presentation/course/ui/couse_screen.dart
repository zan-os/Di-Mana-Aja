import 'package:cached_network_image/cached_network_image.dart';
import 'package:di_mana_aja/config/constant_config.dart';
import 'package:di_mana_aja/registered_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../bloc/course_cubit.dart';
import '../bloc/course_state.dart';
import '../widgets/chapter_tile_widget.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(Icons.adaptive.arrow_back_rounded),
        ),
        title: const Text('Course Detail'),
      ),
      body: _buildBody(),
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          BlocBuilder<CourseCubit, CourseState>(
            builder: (context, state) {
              return CachedNetworkImage(
                  imageUrl:
                      '${sl<ConstantConfig>().basePathCourseImage}/${state.selectedChapter}');
            },
          ),
          const Gap(16),
          _buildChapters(),
        ],
      ),
    );
  }

  BlocBuilder<CourseCubit, CourseState> _buildChapters() {
    return BlocBuilder<CourseCubit, CourseState>(
      buildWhen: (previous, current) =>
          current.chapterList != previous.chapterList,
      builder: (context, state) {
        final listChapter = state.chapterList;

        return ListView.separated(
          shrinkWrap: true,
          itemCount: listChapter.length,
          separatorBuilder: (context, index) => const Gap(12),
          itemBuilder: (context, index) {
            final chapter = listChapter[index];
            return ChapterTiles(
              chapter: chapter,
              chapterOrder: index + 1,
            );
          },
        );
      },
    );
  }
}
