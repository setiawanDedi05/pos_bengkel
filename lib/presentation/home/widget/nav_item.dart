import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_bengkel/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:pos_bengkel/presentation/home/bloc/checkout/checkout_bloc.dart';
import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import 'package:badges/badges.dart' as badges;

class NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 25.0,
            height: 25.0,
            child: label == 'Orders'
                ? BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return SvgPicture.asset(
                            iconPath,
                            colorFilter: ColorFilter.mode(
                              isActive ? AppColors.black : AppColors.disabled,
                              BlendMode.srcIn,
                            ),
                          );
                        },
                        success: (data, qty, price) {
                          return data.isEmpty
                              ? SvgPicture.asset(
                                  iconPath,
                                  colorFilter: ColorFilter.mode(
                                    isActive
                                        ? AppColors.black
                                        : AppColors.disabled,
                                    BlendMode.srcIn,
                                  ),
                                )
                              : badges.Badge(
                                  badgeContent: Text(
                                    qty.toString(),
                                    style:
                                        const TextStyle(color: AppColors.white),
                                  ),
                                  child: SvgPicture.asset(
                                    iconPath,
                                    colorFilter: ColorFilter.mode(
                                      isActive
                                          ? AppColors.black
                                          : AppColors.disabled,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                );
                        },
                      );
                    },
                  )
                : SvgPicture.asset(
                    iconPath,
                    colorFilter: ColorFilter.mode(
                      isActive ? AppColors.black : AppColors.disabled,
                      BlendMode.srcIn,
                    ),
                  ),
          ),
          const SpaceHeight(4.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? AppColors.black : AppColors.disabled,
            ),
          ),
        ],
      ),
    );
  }
}
