import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mediminder/ui/startup/startup_view_model.dart';
import 'package:stacked/stacked.dart';

class StartupView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StratupViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: FlareActor(
              'assets/animations/splash.flr',
              animation: 'intro',
              callback: (name) {
                if (name == 'intro') {
                  model.indicateAnimationComplete();
                }
              },
            ),
          ),
        );
      },
      onModelReady: (model) => SchedulerBinding.instance.addPostFrameCallback(
        (_) => model.onModelReady(),
      ),
      viewModelBuilder: () => StratupViewModel(),
    );
  }
}
