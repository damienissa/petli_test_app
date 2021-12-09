import 'package:flutter/material.dart';
import 'package:petli_test_app/common/design_system/ds_colors.dart';

import '../view_models/home_view_state.dart';
import '../view_models/home_view_model.dart';
import '../widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;
  HomePage({
    Key? key,
    required this.viewModel,
  }) : super(key: key) {
    viewModel.fetch();
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  HomeViewState get state => widget.viewModel.state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Petli test app',
          style: TextStyle(
            fontFamily: 'Butler',
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: DSColors.background,
      ),
      body: HomeWidget(
        state: state,
      ),
    );
  }
}
