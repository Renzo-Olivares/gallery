import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery/studies/reply/colors.dart';
import 'package:gallery/studies/reply/model/bottom_drawer_settings.dart';
import 'package:provider/provider.dart';

class BottomDrawer extends StatelessWidget {
  const BottomDrawer({
    Key key,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      child: Material(
        color: theme.bottomSheetTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: Selector<BottomDrawerSettings, bool>(
          builder: (context, data, child) {
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification.depth == 0) {
                  if (scrollNotification is UserScrollNotification) {
                    switch (scrollNotification.direction) {
                      case ScrollDirection.forward:
                        print('forward');
                        Provider.of<BottomDrawerSettings>(
                          context,
                          listen: false,
                        ).inboxCanScroll = false;
                        break;
                      case ScrollDirection.reverse:
                        print('backwards');
                        break;
                      case ScrollDirection.idle:
                        print('idle');
                        break;
                    }
                  }
//                  if (scrollNotification.metrics.pixels ==
//                      scrollNotification.metrics.maxScrollExtent) {
//                    print('top edge');
//                    Provider.of<BottomDrawerSettings>(
//                      context,
//                      listen: false,
//                    ).inboxCanScroll = false;
//                  }
                }
                return false;
              },
              child: ListView(
                padding: const EdgeInsets.all(12),
                physics: data
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 28),
                  leading,
                  const SizedBox(height: 8),
                  const Divider(
                    color: ReplyColors.blue200,
                    thickness: 0.25,
                    indent: 18,
                    endIndent: 160,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 18),
                    child: Text(
                      'FOLDERS',
                      style: theme.textTheme.caption.copyWith(
                        color: theme
                            .navigationRailTheme.unselectedLabelTextStyle.color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  trailing,
                ],
              ),
            );
          },
          selector: (context, emailStore) {
            return emailStore.inboxCanScroll;
          },
        ),
      ),
    );
  }
}
