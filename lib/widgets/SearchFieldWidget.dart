import 'package:flutter/material.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({super.key});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:_buildSearchTextField(),
    ) ;
  }

   Widget _buildSearchTextField() {
    return  Container(
      height: 48,
      child: TextField(
        maxLines: 1,
        // controller: _searchController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20.0),
          filled: true,
          fillColor: Color.fromARGB(255, 229, 234, 232),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          // contentPadding: EdgeInsets.all(1),
          hintText: 'Search companies...',
          // suffixIcon: widget.filter? _buildSuffixIcon():null,
        ),
      ),
    );
  }
}
