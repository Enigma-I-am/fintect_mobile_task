import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserImage extends StatefulHookConsumerWidget {
  const UserImage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserImageState();
}

class _UserImageState extends ConsumerState<UserImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..repeat();
  late final Animation<double> _scaleAnimation =
      Tween<double>(begin: 0.6, end: 1.2).animate(_controller);
  late final Animation<double> _fadeAnimation =
      Tween<double>(begin: 1, end: 0.2).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 150 * 1.5,
              height: 150 * 1.5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF192259),
              ),
            ),
          ),
        ),
        const CircleAvatar(
          radius: 75,
          backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/24194413?s=400&u=988c708592b9f755ee5356629d39829851041724&v=4'),
        ),
      ],
    );
  }
}
