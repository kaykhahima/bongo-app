import 'package:bongo_app/features/home/provider/the_everything_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => EverythingProvider()),
];
