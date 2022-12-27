import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:working_with_maps/ui/map_screen/map_screen.dart';
import 'package:working_with_maps/view_models/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashViewModel(),
      builder: (context, child) {
        return Scaffold(
          body: Consumer<SplashViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.latLong != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapScreen(
                        latLong: viewModel.latLong,
                      ),
                    ));
              }
              return const Center(
                child: Text("Splash screen"),
              );
            },
          ),
        );
      },
    );
  }
}
