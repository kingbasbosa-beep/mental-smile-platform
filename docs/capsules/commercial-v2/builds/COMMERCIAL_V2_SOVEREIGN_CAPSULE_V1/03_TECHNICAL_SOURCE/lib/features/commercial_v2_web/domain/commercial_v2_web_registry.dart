import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';

import 'commercial_v2_web_section.dart';

class CommercialV2WebRegistry {
  const CommercialV2WebRegistry._();

  static const sections = <CommercialV2WebSection>[
    CommercialV2WebSection(
      id: 'library',
      title: 'Library',
      route: Routes.webLibrary,
      icon: Icons.local_library_outlined,
    ),
  ];
}
