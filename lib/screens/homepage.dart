import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paynless/widgets/history_list.dart';
import 'package:paynless/widgets/wallet.dart';
import '../widgets/banners.dart';

@immutable
class ActionButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final Widget icon;
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Colors.lightBlueAccent,
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Colors.black,
      ),
    );
  }
}

@immutable
class ExpandableFab extends StatefulWidget {
  final bool? initialOpen;

  final double distance;
  final List<Widget> children;
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

@immutable
class FakeItem extends StatelessWidget {
  final bool isBig;

  const FakeItem({
    super.key,
    required this.isBig,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      height: isBig ? 128 : 36,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.amber,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: _toggle,
            child: const Icon(Icons.menu),
          ),
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  final double directionInDegrees;

  final double maxDistance;
  final Animation<double> progress;
  final Widget child;
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 35,
        ),
        centerTitle: true,
        title: const Text(
          'Paynless',
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
              icon: const Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        // alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/Dashboard.png",
            fit: BoxFit.fill,
            width: Get.size.width,
            height: Get.size.height,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 110, bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[600],
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    title: const Text(
                      "Welcome Back,",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    subtitle: const Text(
                      "Vikram!",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Wallet(),
                BannerWidget(),
                const HistoryList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            child: ExpandableFab(
              distance: 90,
              children: [
                ActionButton(
                  onPressed: () {
                    Get.toNamed("/addcash");
                  },
                  icon: const Icon(CupertinoIcons.money_dollar),
                ),
                ActionButton(
                  onPressed: () {
                    Get.toNamed("/history");
                  },
                  icon: const Icon(Icons.history),
                ),
                ActionButton(
                  onPressed: () {
                    Get.toNamed("/profile");
                  },
                  icon: const Icon(Icons.bar_chart_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
