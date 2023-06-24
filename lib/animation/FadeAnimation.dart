// import 'package:flutter/material.dart';
// import 'package:simple_animations/simple_animations.dart';

// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;

//   FadeAnimation(this.delay, this.child);

//   @override
//   Widget build(BuildContext context) {
//     final tween = MultiTrackTween([
//       Track("opacity")
//           .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
//       Track("translateY").add(
//           Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
//           curve: Curves.easeOut)
//     ]);

//     return ControlledAnimation(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builderWithChild: (context, child, animation) => Opacity(
//         opacity: (animation as Map)["opacity"],
//         child: Transform.translate(
//             offset: Offset(0, (animation as Map)["translateY"]), child: child),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:simple_animations/simple_animations.dart';

// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;

//   FadeAnimation(this.delay, this.child);

//   @override
//   Widget build(BuildContext context) {
//     final tween = MultiTween<AnimProps>()
//       ..add(AnimProps.opacity, Tween(begin: 0.0, end: 1.0),
//           Duration(milliseconds: 500))
//       ..add(AnimProps.translateY, Tween(begin: -30.0, end: 0.0),
//           Duration(milliseconds: 500),
//           curve: Curves.easeOut);

//     return PlayAnimation<MultiTweenValues<AnimProps>>(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builder: (context, child, animation) => Opacity(
//         opacity: animation.get(AnimProps.opacity),
//         child: Transform.translate(
//           offset: Offset(0, animation.get(AnimProps.translateY)),
//           child: child,
//         ),
//       ),
//     );
//   }
// }

// enum AnimProps { opacity, translateY }

// import 'package:flutter/material.dart';
// import 'package:simple_animations/simple_animations.dart';

// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;

//   FadeAnimation(this.delay, this.child);

//   @override
//   Widget build(BuildContext context) {
//     final tween = MultiTween<AnimProps>()
//       ..add(AnimProps.opacity, Tween(begin: 0.0, end: 1.0),
//           Duration(milliseconds: 500))
//       ..add(
//         AnimProps.translateY,
//         CurvedTween(begin: -30.0, end: 0.0, curve: Curves.easeOut),
//         Duration(milliseconds: 500),
//       );

//     return PlayAnimation<MultiTweenValues<AnimProps>>(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builder: (context, child, animation) => Opacity(
//         opacity: animation.get(AnimProps.opacity),
//         child: Transform.translate(
//           offset: Offset(0, animation.get(AnimProps.translateY)),
//           child: child,
//         ),
//       ),
//     );
//   }
// }

// enum AnimProps { opacity, translateY }

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimProps>()
      ..add(AnimProps.opacity, Tween(begin: 0.0, end: 1.0),
          Duration(milliseconds: 500))
      ..add(
        AnimProps.translateY,
        TweenSequence([
          TweenSequenceItem(tween: Tween(begin: -30.0, end: 0.0), weight: 1.0),
        ]),
        Duration(milliseconds: 500),
      );

    return PlayAnimation<MultiTweenValues<AnimProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AnimProps.opacity),
        child: Transform.translate(
          offset: Offset(0, animation.get(AnimProps.translateY)),
          child: child,
        ),
      ),
    );
  }
}

enum AnimProps { opacity, translateY }
