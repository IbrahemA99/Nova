import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navo/core/resources/assets_manager.dart';
import 'package:navo/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';

class BrandsListWidget extends StatelessWidget {
  BrandsListWidget({super.key});

  final List<String> brands = [
    ImageAssets.dellBrand,
    ImageAssets.appleBrand,
    ImageAssets.zamalekBrand,
    ImageAssets.zaraBrand,
    ImageAssets.bershkaBrand,
    ImageAssets.nikeBrand,
    ImageAssets.newBalanceBrand,
    ImageAssets.adidasBrand,
    ImageAssets.gucciBrand,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: CustomBrandWidget(
              image: brands[index],
            ),
          );
        },
      ),
    );
  }
}