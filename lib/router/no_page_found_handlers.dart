import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/ui/views/views.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(
    handlerFunc: (context, parameters) {
      Provider.of<SideBarProvider>(context!).setCurrentPageUrl('/404');
      return const NoPageFoundView();
    },
  );
}
