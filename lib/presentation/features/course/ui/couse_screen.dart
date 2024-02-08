import 'package:cached_network_image/cached_network_image.dart';
import 'package:di_mana_aja/config/color_palette.dart';
import 'package:di_mana_aja/config/constant_config.dart';
import 'package:di_mana_aja/di/registered_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/chapter_tile_widget.dart';
import '../bloc/course_cubit.dart';
import '../bloc/course_state.dart';

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
        centerTitle: true,
        title: const Text('Course Detail'),
      ),
      body: _buildBody(context),
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          addAutomaticKeepAlives: true,
          physics: const ClampingScrollPhysics(),
          children: [
            const Gap(20),
            _buildCourseInfo(),
            _buildChapters(),
            const Gap(20),
          ],
        ),
      ),
    );
  }

  BlocBuilder<CourseCubit, CourseState> _buildCourseInfo() {
    return BlocBuilder<CourseCubit, CourseState>(
      buildWhen: (previous, current) =>
          current.selectedCourse != previous.selectedCourse ||
          current.isLoading != previous.isLoading,
      builder: (context, state) {
        final imageUrl =
            '${sl<ConstantConfig>().basePathCourseImage}/${state.selectedCourse.imageUrl}';
        final courseRating = state.selectedCourse.averageRating;
        final totalRating = state.selectedCourse.totalRating.toString();
        if (!state.isLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                ),
              ),
              const Gap(16),
              Text(
                state.selectedCourse.title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(16),
              Text(
                state.selectedCourse.level,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(16),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: courseRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemCount: 5,
                    itemSize: 20,
                    unratedColor: Colors.grey.shade600,
                    itemPadding: const EdgeInsets.only(right: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      CupertinoIcons.star_fill,
                      color: ColorPalette.orange,
                    ),
                    onRatingUpdate: (_) {},
                  ),
                  const Gap(4),
                  Text(
                    '${courseRating.toStringAsFixed(1)}/5 ',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    '($totalRating)',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Gap(16),
            ],
          );
        }

        return const Text('Loading image...');
      },
    );
  }

  BlocBuilder<CourseCubit, CourseState> _buildChapters() {
    return BlocBuilder<CourseCubit, CourseState>(
      buildWhen: (previous, current) =>
          current.chapterList != previous.chapterList ||
          current.isLoading != previous.isLoading,
      builder: (context, state) {
        final listChapter = state.chapterList;

        if (!state.isLoading) {
          return ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
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
        }

        return const Text('Loading chapters...');
      },
    );
  }
}
