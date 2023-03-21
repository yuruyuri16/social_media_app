import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _PostUserInfo(),
          const _PostContent(),
          const _PostActions(),
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _PostLikes(),
                _PostDescription(),
                _PostComments(),
                SizedBox(height: AppSpacing.sm),
                _PostAddComment(),
                SizedBox(height: AppSpacing.sm),
                _PostCreatedTime(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PostUserInfo extends StatelessWidget {
  const _PostUserInfo();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.sm,
            AppSpacing.sm,
            0,
            AppSpacing.sm,
          ),
          child: CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQJlwSiVSYPSDq3WyLiDm8KUZyUwX8z8DskuvOC9u3ENsxbGPRa_Ah3odil3LKaZOU8Ev-ZYZ9fBcqqrfA',
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(alignment: Alignment.centerLeft),
            onPressed: () {},
            child: Text(
              'user name',
              style: theme.textTheme.titleSmall,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }
}

class _PostContent extends StatelessWidget {
  const _PostContent();

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://media.istockphoto.com/id/636810092/es/foto/miraflores-en-lima-per%C3%BA.jpg?s=612x612&w=0&k=20&c=5z06raLfZyY-wQs3PJzFc0m77nbdKnLpinLIF-wu7z8=',
    );
  }
}

class _PostActions extends StatelessWidget {
  const _PostActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_outline),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.comment),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.send),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.flag),
        ),
      ],
    );
  }
}

class _PostLikes extends StatelessWidget {
  const _PostLikes();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      '11,122 likes',
      style: theme.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _PostDescription extends StatelessWidget {
  const _PostDescription();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'yuruyuri16 ',
            style: theme.textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const TextSpan(
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          )
        ],
      ),
      maxLines: 2,
      style: theme.textTheme.bodyMedium?.copyWith(
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _PostComments extends StatelessWidget {
  const _PostComments();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerLeft,
          ),
          child: Text(
            'View all 10 comments',
            style: theme.textTheme.labelSmall?.copyWith(),
          ),
        ),
      ],
    );
  }
}

class _PostAddComment extends StatelessWidget {
  const _PostAddComment();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => showModalBottomSheet<void>(
        context: context,
        builder: (context) => BottomSheet(
          onClosing: () {},
          builder: (context) => ColoredBox(
            color: Colors.red,
            child: Column(
              children: const [
                Text('Comment'),
              ],
            ),
          ),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundImage: NetworkImage(
              'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQJlwSiVSYPSDq3WyLiDm8KUZyUwX8z8DskuvOC9u3ENsxbGPRa_Ah3odil3LKaZOU8Ev-ZYZ9fBcqqrfA',
            ),
          ),
          const SizedBox(
            width: AppSpacing.sm,
          ),
          Text(
            'Add a comment...',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _PostCreatedTime extends StatelessWidget {
  const _PostCreatedTime();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      '5 hours ago',
      style: theme.textTheme.bodySmall,
    );
  }
}
