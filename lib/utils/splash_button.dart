// // import 'package:flutter/material.dart';
// // import 'package:cartapp/core/app_colors.dart';

// // class SplashButton extends StatelessWidget {
// //   final Widget child;
// //   final VoidCallback onTap;
// //   final double width;
// //   final double height;

// //   const SplashButton({
// //     super.key,
// //     required this.child,
// //     required this.onTap,
// //     required this.width,
// //     required this.height,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         width: width,
// //         height: height,
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(12),
// //           gradient: LinearGradient(
// //             colors: [
// //               AppColors.primary,      // Lighter left color
// //               AppColors.primaryDark,  // Lighter right color
// //             ],
// //             begin: Alignment.centerLeft,
// //             end: Alignment.centerRight,
// //           ),
// //         ),
// //         alignment: Alignment.center,
// //         child: child,
// //       ),
// //     );
// //   }
// // }




// import 'package:flutter/material.dart';
// import 'package:cartapp/core/app_colors.dart';

// class SplashButton extends StatelessWidget {
//   final Widget child;
//   final VoidCallback onTap;
//   final double width;
//   final double height;
//   final IconData? icon;           // <-- OPTIONAL ICON
//   final double iconSize;
//   final Color iconColor;

//   const SplashButton({
//     super.key,
//     required this.child,
//     required this.onTap,
//     required this.width,
//     required this.height,
//     this.icon,                    // <-- OPTIONAL
//     this.iconSize = 22,
//     this.iconColor = Colors.white,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           gradient: LinearGradient(
//             colors: [
//               AppColors.primary,
//               AppColors.primaryDark,
//             ],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//           ),
//         ),
//         alignment: Alignment.center,

//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (icon != null) ...[
//               Icon(icon, size: iconSize, color: iconColor),
//               const SizedBox(width: 8),  // spacing
//             ],
//             child,
//           ],
//         ),
//       ),
//     );
//   }
// }





// utils/splash_button.dart
import 'package:cartapp/core/app_colors.dart';
import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double? width;
  final double? height;
  final Gradient? gradient;

  const SplashButton({
    super.key,
    required this.onTap,
    required this.child,
    this.width,
    this.height,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient ??
              const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark]),
          borderRadius: BorderRadius.circular(12),
          
        ),
        alignment: Alignment.center,
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          child: child,
        ),
      ),
    );
  }
}