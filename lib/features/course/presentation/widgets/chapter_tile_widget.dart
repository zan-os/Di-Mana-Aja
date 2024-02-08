import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../config/color_palette.dart';
import '../model/course_display_model.dart';

class ChapterTiles extends StatelessWidget {
  const ChapterTiles({
    super.key,
    required this.chapter,
    required this.chapterOrder,
  });

  final ChapterDisplayModel chapter;
  final int chapterOrder;

  @override
  Widget build(BuildContext context) {
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
              TextSpan(text: 'Section $chapterOrder '),
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
              Flexible(
                child: Row(
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
                    Flexible(
                      child: Text(
                        focusKey,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
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
