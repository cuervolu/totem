// lib/features/home/presentation/widgets/widgets/rss_widget.dart
import 'package:flutter/material.dart';
import 'package:totem/features/home/domain/models/rss_feed.dart';

class RssWidget extends StatelessWidget {
  final VoidCallback onClick;

  const RssWidget({super.key, required this.onClick});

  static const _feeds = [
    RssFeed(
      title: 'Godot 4.3 Released',
      source: 'Godot Blog',
      time: '2h',
      unread: true,
    ),
    RssFeed(
      title: 'Kotlin 2.1 Features',
      source: 'Kotlin Blog',
      time: '5h',
      unread: true,
    ),
    RssFeed(
      title: 'Rust 1.75 Stable',
      source: 'Rust Blog',
      time: '1d',
      unread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final unreadCount = _feeds.where((f) => f.unread).length;

    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        constraints: const BoxConstraints(minHeight: 280),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.tertiary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.rss_feed,
                      size: 24,
                      color: theme.colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Noticias',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                if (unreadCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      unreadCount.toString(),
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onError,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            ..._feeds.map(
              (feed) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _RssFeedItem(feed: feed),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RssFeedItem extends StatelessWidget {
  final RssFeed feed;

  const _RssFeedItem({required this.feed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          if (feed.unread)
            Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.error,
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feed.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${feed.source} • ${feed.time}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onPrimary.withOpacity(0.7),
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
