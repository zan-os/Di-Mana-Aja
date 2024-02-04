import 'package:di_mana_aja/config/color_palette.dart';
import 'package:di_mana_aja/features/course/presentation/bloc/course_cubit.dart';
import 'package:di_mana_aja/features/course/presentation/bloc/course_state.dart';
import 'package:di_mana_aja/features/course/presentation/model/course_display_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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
      child: _buildChapters(),
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
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final chapter = listChapter[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(text: 'Section ${index + 1} '),
                      TextSpan(
                        text: chapter.title,
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                _buildKeyFocus(chapter)
              ],
            );
          },
        );
      },
    );
  }

  ListView _buildKeyFocus(ChapterDisplayModel chapter) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: chapter.contentFocusKey.length,
      padding: const EdgeInsets.only(left: 10),
      separatorBuilder: (context, index) => const Gap(16),
      itemBuilder: (context, index) {
        final focusKey = chapter.contentFocusKey[index].focusKey;
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorPalette.darkBlueAccent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.grey.shade700,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    focusKey,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Icon(
                Icons.check_circle_outline_rounded,
                color: ColorPalette.green,
              )
            ],
          ),
        );
      },
    );
  }
}
