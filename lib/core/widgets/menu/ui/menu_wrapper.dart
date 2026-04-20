import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/home/presentation/ui/screens/widgets/side_menu_widget.dart';
import '../bloc/menu_cubit.dart';
import '../bloc/menu_state.dart';

class MenuWrapper extends StatelessWidget {
  final Widget child;

  const MenuWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        final cubit = MenuCubit.get(context);

        return Stack(
          children: [
            // 1. The main screen content (Home, Cart, etc.)
            child,

            // 2. Dim Overlay
            if (cubit.isMenuOpen)
              GestureDetector(
                onTap: () => cubit.toggleMenu(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color: Colors.black.withOpacity(0.3),
                ),
              ),

            // 3. Side Menu
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: cubit.isMenuOpen ? 0 : -MediaQuery.of(context).size.width,
              top: 0,
              bottom: 0,
              child: const SideMenuWidget(),
            ),
          ],
        );
      },
    );
  }
}
