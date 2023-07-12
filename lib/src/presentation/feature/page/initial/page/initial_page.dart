import 'package:multi_vendor_starter/src/presentation/component/app_bar/mvs_screen_app_bar.dart';
import 'package:multi_vendor_starter/src/presentation/component/scaffold/mvs_scaffold.dart';
import 'package:multi_vendor_starter/src/presentation/component/text/mvs_text.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class InitialPage extends StatelessWidget {
  const InitialPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final IFPCSize size = context.componentSize;
    final IConfig config = context.read<IConfig>();

    return MVSScaffold(
      appBar: MVSScreenAppBar(
        context: context,
        title: "Multi vendor starter",
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MVSText.medium16Black(
              context: context,
              text: config.environment.name,
            ),
            SizedBox(height: size.s16 / 4),
            MVSText.medium16Black(
              context: context,
              text: config.baseUrl,
            ),
            SizedBox(height: size.s16 / 4),
            MVSText.medium16Black(
              context: context,
              text: config.apiController,
            ),
          ],
        ),
      ),
    );
  }
}
