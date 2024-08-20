import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/resourses/color_manager.dart';
import 'package:flutter_template/core/resourses/values_manager.dart';

class AppProgressButton extends StatefulWidget {
  final String? text;
  final TextStyle textStyle;
  final Widget? child;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? progressIndicatorColor;
  final bool? isBordered;
  final Color? textColor;
  final double? fontSize;
  final double? radius;
  final double? elevation;
  final Color? borderColor;
  final EdgeInsets? padding;
  final Function(AnimationController animationController)? onPressed;

  const AppProgressButton({
    Key? key,
    required this.onPressed,
    this.text,
    required this.textStyle,
    this.child,
    this.width,
    this.backgroundColor,
    this.shadowColor,
    this.textColor,
    this.fontSize,
    this.isBordered,
    this.height,
    this.progressIndicatorColor,
    this.radius = AppSize.s10,
    this.elevation,
    this.padding,
    this.borderColor,
  }) : super(key: key);

  @override
  State<AppProgressButton> createState() => AppProgressButtonState();
}

class AppProgressButtonState extends State<AppProgressButton>
    with TickerProviderStateMixin {
  late Animation<double> sizeAnimation;
  late Animation<BorderRadiusGeometry?> radiusAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // buttonHeight = widget.height ?? 48.h;

    final curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );

    sizeAnimation = Tween<double>(
      begin: widget.width ?? MediaQuery.of(context).size.width * .44,
      end: widget.height ?? 48.h,
    ).animate(curvedAnimation);

    radiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(widget.radius ?? AppSize.s8.r),
      end: BorderRadius.circular(50),
    ).animate(curvedAnimation);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        constraints: BoxConstraints(
          minWidth: sizeAnimation.value,
        ),
        width: sizeAnimation.value,
        height: widget.height ?? 48.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shadowColor: widget.shadowColor,
            elevation: widget.elevation ?? 0.0,
            fixedSize: Size(sizeAnimation.value, 48.h),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            foregroundColor: widget.backgroundColor ?? AppColor.primaryColor,
            backgroundColor: widget.backgroundColor ?? AppColor.secondryColor,
            shape: RoundedRectangleBorder(
              borderRadius: radiusAnimation.value!,
              side: !(widget.isBordered ?? false)
                  ? BorderSide.none
                  : BorderSide(
                      color: widget.borderColor ??
                          widget.textColor ??
                          AppColor.primaryColor,
                      width: 1.sp,
                    ),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          onPressed: () async {
            if (controller.isCompleted) {
              try {
                controller.dispose();
              } catch (_) {}
              return;
            }
            if (widget.onPressed != null) {
              widget.onPressed!(controller);
            }
          },
          child: controller.isCompleted
              ? Container(
                  height: 48.h,
                  width: sizeAnimation.value,
                  padding: widget.padding ?? EdgeInsets.all(AppSize.s12.r),
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    backgroundColor:
                        widget.progressIndicatorColor ?? Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      widget.textColor ?? AppColor.white,
                    ),
                  ),
                )
              : FittedBox(
                  child: widget.child ??
                      Text(
                        textScaler: const TextScaler.linear(1.0),
                        widget.text ?? 'Click Me',
                        style: widget.textStyle,
                      ),
                ),
        ),
      ),
    );
  }
}
