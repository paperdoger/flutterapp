import 'package:flutter/material.dart';
import 'package:flutter_xv/main.dart';
import 'package:flutter_xv/setting/page/about_page.dart';
import 'package:flutter_xv/setting/page/account_manager_page.dart';
import 'package:flutter_xv/setting/page/setting_page.dart';
import 'package:flutter_xv/setting/page/theme_page.dart';
import 'package:flutter_xv/setting/provider/theme_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final Map<String, Widget> map = <String, Widget>{};
  map['about_page'] = const AboutPage();
  map['account_manager_page'] = const AccountManagerPage();
  map['setting_page'] = const SettingPage();
  map['theme_page'] = const ThemePage();
  
  group('setting => 检测页面可点击目标大小是否大于44 * 44', () {
    map.forEach((name, page) {
      testWidgets(name, (WidgetTester tester) async {
        final SemanticsHandle handle = tester.ensureSemantics();
        await tester.pumpWidget(MyApp(home: page));
        await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
        handle.dispose();
      });
    });
  });

  group('setting => 检测页面可点击目标是否都有语义', () {
    map.forEach((name, page) {
      testWidgets(name, (WidgetTester tester) async {
        final SemanticsHandle handle = tester.ensureSemantics();
        await tester.pumpWidget(MyApp(home: page));
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        handle.dispose();
      });
    });
  });

  group('setting => 检测页面文本对比度是否满足最小值的准则', () {
    final List<ThemeData> themes = <ThemeData>[
      ThemeProvider().getTheme(),
      ThemeProvider().getTheme(isDarkMode: true),
    ];

    const List<String> themeNames = <String>[
      'LightTheme',
      'DarkTheme',
    ];

    for (int themeIndex = 0; themeIndex < themes.length; themeIndex += 1) {
      final ThemeData theme = themes[themeIndex];
      final String themeName = themeNames[themeIndex];

      map.forEach((name, page) {
        testWidgets('$name $themeName', (WidgetTester tester) async {
          final SemanticsHandle handle = tester.ensureSemantics();
          await tester.pumpWidget(MyApp(theme: theme, home: page));
          await expectLater(tester, meetsGuideline(textContrastGuideline));
          handle.dispose();
        });
      });
    }
  });
}
