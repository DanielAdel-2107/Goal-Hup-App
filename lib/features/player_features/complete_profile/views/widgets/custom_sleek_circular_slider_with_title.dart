import 'package:flutter/material.dart';
import 'package:goal_hup/core/utilies/colors/app_colors.dart';
import 'package:goal_hup/core/utilies/extensions/app_extensions.dart';
import 'package:goal_hup/core/utilies/styles/app_text_styles.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CustomSleekCircularSliderWithTitle extends StatefulWidget {
  const CustomSleekCircularSliderWithTitle(
      {super.key,
      required this.title,
      required this.min,
      required this.max,
      this.onChangeEnd});
  final String title;
  final double min, max;
  final Function(double)? onChangeEnd;
  @override
  State<CustomSleekCircularSliderWithTitle> createState() =>
      _CustomSleekCircularSliderWithTitleState();
}

class _CustomSleekCircularSliderWithTitleState
    extends State<CustomSleekCircularSliderWithTitle> {
  double? _power;

  @override
  initState() {
    _power = widget.max / 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.title18PrimaryColorW500,
        ),
        SizedBox(
          height: context.screenHeight * 0.18,
          width: context.screenWidth * 0.35,
          child: SleekCircularSlider(
            appearance: CircularSliderAppearance(
              size: 150,
              customWidths: CustomSliderWidths(
                progressBarWidth: 12,
                trackWidth: 8,
                shadowWidth: 15,
              ),
              customColors: CustomSliderColors(
                progressBarColor: AppColors.kPrimaryColor,
                trackColor: Colors.grey.shade300,
                shadowColor: AppColors.kPrimaryColor.withOpacity(0.3),
                dotColor: Colors.blue.shade700,
                hideShadow: false,
              ),
              animationEnabled: true,
              infoProperties: InfoProperties(
                mainLabelStyle: AppTextStyles.title24PrimaryColorW500,
                modifier: (double value) => '${value.toInt()}',
              ),
            ),
            onChangeEnd: widget.onChangeEnd,
            min: widget.min,
            max: widget.max,
            initialValue: _power!,
            onChange: (double value) {
              setState(() {
                _power = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
