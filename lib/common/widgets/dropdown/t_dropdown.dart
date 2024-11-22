import 'package:flutter/material.dart';
import 'package:t_savaari/utils/constants/colors.dart';
import 'package:t_savaari/utils/constants/sizes.dart';
import 'package:t_savaari/utils/helpers/helper_functions.dart';
import 'package:dropdown_search/dropdown_search.dart';


class TDropdown extends StatelessWidget {
  const TDropdown(
      {super.key,
      this.width = 400,
      this.height = 50,
      this.value,
      required this.items,
      required this.labelText,
      required this.onChanged});

  final double width;
  final double height;
  final String? value;
  final List<String> items;
  final String labelText;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DropdownSearch<String>(
      autoValidateMode: AutovalidateMode.always,
      selectedItem: value,
      popupProps: PopupProps.dialog(
        showSearchBox: true,
        showSelectedItems: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: dark ? TColors.grey : TColors.darkGrey),
            prefixIcon: Icon(
              Icons.search,
              size: TSizes.md,
              color: dark ? TColors.grey : TColors.darkGrey,
            ),
          ),
        ),
        containerBuilder: (context, child) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(TSizes.sm),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.sm),
                color: dark ? TColors.dark : TColors.light,
                boxShadow: [
                  BoxShadow(
                    color: dark
                        ? TColors.light.withOpacity(0.3)
                        : TColors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: child,
            ),
          );
        },
        itemBuilder: (context, item, isSelected) {
          return Container(
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.defaultSpace / 2,
              horizontal: TSizes.defaultSpace,
            ),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: .5,
                      color: dark
                          ? TColors.darkContainer
                          : TColors.dark.withOpacity(.1))),
            ),
            child: Text(
              item,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        },
      ),
      items: items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.left,
        dropdownSearchDecoration: InputDecoration.collapsed(
          hintText: labelText,
        ),
      ),
      dropdownBuilder: (context, selectedItem) => Row(
        children: [
          const SizedBox(
            width: TSizes.defaultSpace,
          ),
          Text(
            selectedItem ?? labelText,
            style: selectedItem != null
                ? Theme.of(context).textTheme.bodyLarge
                : Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
      onChanged: onChanged,
    );
  }
}
