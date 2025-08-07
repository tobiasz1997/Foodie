import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/bootstrap/theme/theme.dart';
import 'package:foodie/common/routes/routes.dart';
import 'package:foodie/common/static/constant.dart';
import 'package:foodie/common/storage/database_helper.dart';
import 'package:foodie/widgets/drawer/language_option.dart';
import 'package:foodie/widgets/drawer/switch_option.dart';
import 'package:foodie/widgets/shared/buttons/primary_button_outline.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FdDrawer extends StatefulWidget {
  const FdDrawer({super.key});

  @override
  State<FdDrawer> createState() => _FdDrawerState();
}

class _FdDrawerState extends State<FdDrawer> {
  late final _appName;
  late final _version;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _appName = info.appName;
      _version = '${info.version} (${info.buildNumber})';
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    void _openBrowserURL(String stringUrl) async {
      final Uri url = Uri.parse(stringUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    }

    void _openEmailApp() async {
      final Uri params = Uri(
        scheme: 'mailto',
        path: emailUrl,
        query: 'subject=Foodie App Feedback&body=Hi Grzegorz,',
      );

      if (await canLaunchUrl(params)) {
        await launchUrl(params);
      }
    }

    DrawerHeader _drawerHeader(BuildContext context) => DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75),
              ), //BoxShadow
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                backgroundImage:
                    const AssetImage('assets/logo/foodie_logo.png'),
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'John Snow',
                    style: Theme.of(context).textTheme.displayMedium!,
                  ),
                ),
              ),
            ],
          ),
        );

    PrimaryButtonOutline _aboutDialog(BuildContext context) =>
        PrimaryButtonOutline(
          text: AppLocalizations.of(context)!.aboutApp,
          onPressed: () => showAboutDialog(
            context: context,
            applicationIcon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              ),
              padding: const EdgeInsets.all(7),
              width: 50,
              height: 50,
              child: Image.asset('assets/logo/foodie_logo.png'),
            ),
            applicationName: _appName,
            applicationVersion: _version,
            applicationLegalese: AppLocalizations.of(context)!.appDescription,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => _openBrowserURL(githubUrl),
                      icon: FaIcon(
                        FontAwesomeIcons.github,
                        size: 25,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _openBrowserURL(linkedInUrl),
                      icon: FaIcon(
                        FontAwesomeIcons.linkedin,
                        size: 25,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _openEmailApp(),
                      icon: FaIcon(
                        FontAwesomeIcons.envelope,
                        size: 25,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          _drawerHeader(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(AppLocalizations.of(context)!.profile),
                          onTap: () =>
                              Navigator.of(context).pushNamed(profilePageRoute),
                          leading: const FaIcon(
                            FontAwesomeIcons.user,
                            size: 18,
                          ),
                        ),
                        const Divider(),
                        SwitchOption(
                          switchLabel: AppLocalizations.of(context)!.darkTheme,
                          switchValue: _themeChanger.isDarkTheme(),
                          switchChanged: (value) =>
                              _themeChanger.setTheme(value),
                        ),
                        const LanguageOption(),
                        const Divider(),
                        ListTile(
                          title: const Text('Clear local data'),
                          onTap: () => DatabaseHelper.instance.clearTables(),
                          leading: const FaIcon(
                            FontAwesomeIcons.database,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [_aboutDialog(context)],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
