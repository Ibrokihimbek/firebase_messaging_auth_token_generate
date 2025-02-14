import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fcm_send_token_generate/core/loading/modal_progress_hud.dart';
import 'package:fcm_send_token_generate/feature/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  AdaptiveThemeMode? themeMode;

  @override
  void initState() {
    super.initState();
    _getMode();
  }

  Future<void> _getMode() async {
    final mode = await AdaptiveTheme.getThemeMode();
    setState(() {
      themeMode = mode ?? AdaptiveThemeMode.light;
    });
  }

  Future<void> _switchTheme() async {
    if (themeMode == null) return;
    if (themeMode!.isDark) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
    await _getMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json to Token', style: TextStyle(color: Colors.white),),
        actions: [
          if (themeMode != null)
            IconButton(
              onPressed: _switchTheme,
              icon: Icon(
                themeMode!.isDark ? Icons.light_mode : Icons.dark_mode,
                color: Colors.white,
              ),
            ),
          const SizedBox(width: 16),
        ],
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state.tokenStatus.isLoading,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _controller,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: 'Enter JSON',
                          border: const OutlineInputBorder(),
                          focusedBorder: themeMode!.isDark
                              ? const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                )
                              : const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueAccent),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          context.read<HomeBloc>().add(
                            GetAccessTokenEvent(
                              json: _controller.text,
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'Generate Token',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.token,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      if (state.token.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: state.token));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Token copied to clipboard'),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Copy Token',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

