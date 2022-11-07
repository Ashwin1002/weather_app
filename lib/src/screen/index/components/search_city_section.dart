import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant/constant_list.dart';
import '../../../state/index_state.dart';
import '../../../widget/custom_textform_field.dart';
import '../../../widget/widget_space.dart';

class SearchCitySection extends StatelessWidget {
  const SearchCitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    var state = context.watch<IndexState>();

    return Container(
      margin:
      const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: CustomFormField(
              controller: state.searchController,
              hintText: 'Search City / Location',
              onChanged: (value){},
            ),
          ),
          horizontalSpace(width: 8.0),
          Expanded(
            child: InkWell(
              onTap: () {
                state.checkConnection();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 2.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius:
                    BorderRadius.circular(8.0)),
                child: Center(
                  child: Text(
                    state.searchController.text
                        .isEmpty
                        ? 'Save'
                        : "Update",
                    style: textTheme.displayMedium
                        ?.copyWith(
                        color: Colors.white,
                        fontSize: 12.0,
                        overflow: TextOverflow
                            .ellipsis),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
