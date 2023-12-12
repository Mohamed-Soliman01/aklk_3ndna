import 'package:aklk_3ndna/features/home/presentation/view/search_view.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchBoxWidget extends StatelessWidget {
  const SearchBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Card(
        color: Colors.grey,
        elevation: 1,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (builder) => SearchView()),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
                const SizedBox(width: 5),
                Text(S.of(context).Findyourfavoritemeals),
                const Spacer(),
                const Icon(Icons.filter_list_sharp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
