// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/animation.dart';

import 'framework.dart';

abstract class StatusTransitionComponent extends StatefulComponent {
  StatusTransitionComponent({
    Key key,
    this.animation
  }) : super(key: key) {
    assert(animation != null);
  }

  final Animated<double> animation;

  Widget build(BuildContext context);

  _StatusTransitionState createState() => new _StatusTransitionState();
}

class _StatusTransitionState extends State<StatusTransitionComponent> {
  void initState() {
    super.initState();
    config.animation.addStatusListener(_performanceStatusChanged);
  }

  void didUpdateConfig(StatusTransitionComponent oldConfig) {
    if (config.animation != oldConfig.animation) {
      oldConfig.animation.removeStatusListener(_performanceStatusChanged);
      config.animation.addStatusListener(_performanceStatusChanged);
    }
  }

  void dispose() {
    config.animation.removeStatusListener(_performanceStatusChanged);
    super.dispose();
  }

  void _performanceStatusChanged(PerformanceStatus status) {
    setState(() {
      // The performance's state is our build state, and it changed already.
    });
  }

  Widget build(BuildContext context) {
    return config.build(context);
  }
}
