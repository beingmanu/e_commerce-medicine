import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../config/theme.dart';
import '../provider/user_provider.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(
    create: (_) => UserProvider(),
  ),
  ChangeNotifierProvider(
    create: (_) => AppThemeData(),
  ),
];
