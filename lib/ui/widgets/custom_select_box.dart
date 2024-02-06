import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class CustomSelectBoxItem {
  final String label;
  final dynamic value;

  CustomSelectBoxItem({required this.label, required this.value});
}

class CustomSelectBox extends StatefulWidget {
  final List<CustomSelectBoxItem> items;
  final String label;
  final dynamic selectedValue;
  final Function(CustomSelectBoxItem?) onChange;
  const CustomSelectBox({
    Key? key,
    required this.items,
    required this.label,
    required this.onChange,
    this.selectedValue,
  }) : super(key: key);

  @override
  State<CustomSelectBox> createState() => _CustomSelectBoxState();
}

class _CustomSelectBoxState extends State<CustomSelectBox> {
  CustomSelectBoxItem? _selectedItem;

  @override
  void initState() {
    super.initState();
    for (CustomSelectBoxItem selectBoxItem in widget.items) {
      if (widget.selectedValue == selectBoxItem.value) {
        _selectedItem = selectBoxItem;
        setState(() {});
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => CustomSelectBoxDialog(
              label: widget.label,
              items: widget.items,
              onSelect: (item) {
                widget.onChange(item);
                _selectedItem = item;
                setState(() {});
              },
            ),
          );
        },
        borderRadius: BorderRadius.zero,
        focusColor: Colors.grey[50],
        hoverColor: Colors.grey[50],
        splashColor: Colors.grey[100],
        highlightColor: Colors.grey[50],
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: _selectedItem != null ? 3 : 20,
            top: _selectedItem != null ? 3 : 13.5,
            bottom: _selectedItem != null ? 3 : 13.5,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _selectedItem != null ? _selectedItem!.label : widget.label,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: _selectedItem != null
                                  ? Colors.black87
                                  : Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              _selectedItem != null
                  ? SizedBox(
                      width: 80,
                      height: 45,
                      child: Material(
                        color: Colors.grey.withOpacity(.25),
                        borderRadius: BorderRadius.zero,
                        child: InkWell(
                          onTap: () {
                            _selectedItem = null;
                            widget.onChange(null);
                            setState(() {});
                          },
                          focusColor: Colors.white10,
                          hoverColor: Colors.white10,
                          highlightColor: Colors.white10,
                          splashColor: Colors.white12,
                          child: Center(
                            child: Text(
                              'Clear',
                              style: GoogleFonts.montserrat(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: iconColor,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSelectBoxDialog extends StatelessWidget {
  final List<CustomSelectBoxItem> items;
  final String label;
  final Function(CustomSelectBoxItem) onSelect;

  const CustomSelectBoxDialog({
    Key? key,
    required this.label,
    required this.items,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 60,
      ),
      child: Stack(
        children: [
          SizedBox(
            width: 400,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            label,
                            style: GoogleFonts.montserrat(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            color: mutedIconColor,
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    items.isNotEmpty
                        ? Flexible(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  onSelect(items[index]);
                                  Navigator.pop(context);
                                },
                                borderRadius: BorderRadius.zero,
                                focusColor: Colors.grey[50],
                                hoverColor: Colors.grey[50],
                                splashColor: Colors.grey[100],
                                highlightColor: Colors.grey[50],
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    items[index].label,
                                    style: GoogleFonts.montserrat(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                height: 15,
                              ),
                              itemCount: items.length,
                            ),
                          )
                        : const Center(
                            child: Text(
                              'No items!',
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
