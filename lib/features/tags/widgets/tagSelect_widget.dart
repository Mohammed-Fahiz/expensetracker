import 'package:expensetracker/features/tags/models/tagModel.dart';
import 'package:expensetracker/features/tags/widgets/tagTile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Provider to manage selected tags
final selectedTagsProvider = StateProvider<List<String>>((ref) => []);

class TagSelectWidget extends ConsumerWidget {
  final List<TagModel> tagList;
  final bool isSingleSelect;
  final bool? hideSelectedCount;

  const TagSelectWidget({
    super.key,
    required this.tagList,
    this.hideSelectedCount = false,
    required this.isSingleSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedTags = ref.watch(selectedTagsProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!hideSelectedCount!)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Text(
                'Selected: ${selectedTags.length}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
            ),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: tagList.map((tag) {
              final isSelected = selectedTags.contains(tag.tagName);
              return GestureDetector(
                onTap: () {
                  final updatedTags = List<String>.from(selectedTags);
                  if (isSingleSelect) {
                    updatedTags.clear();
                    if (!isSelected) {
                      updatedTags.add(tag.tagName);
                    }
                  } else {
                    if (isSelected) {
                      updatedTags.remove(tag.tagName);
                    } else {
                      updatedTags.add(tag.tagName);
                    }
                  }
                  ref.read(selectedTagsProvider.notifier).state = updatedTags;
                },
                child: TagTileWidget(
                  tagName: tag.tagName,
                  isSelected: isSelected,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
