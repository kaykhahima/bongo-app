import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeSearchField extends StatefulWidget {
  const HomeSearchField({super.key});

  @override
  State<HomeSearchField> createState() => _HomeSearchFieldState();
}

class _HomeSearchFieldState extends State<HomeSearchField> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(90.0)),
      borderSide: BorderSide.none,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search..',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  prefixIcon: const Icon(Icons.search),
                  border: border,
                  filled: true,
                  isDense: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  focusedBorder: border,
                  focusedErrorBorder: border,
                  enabledBorder: border,
                  errorBorder: border,
                  disabledBorder: border,
                ),
              ),
            ),
          ),
          const Gap(24.0),
          IconButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all(Colors.white.withOpacity(0.5)),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              // size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
