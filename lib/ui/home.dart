import 'package:flutter/material.dart';
import 'package:flutter_sample/provider/status_provider.dart';
import 'package:flutter_sample/ui/cloud/cloud.dart';
import 'package:flutter_sample/ui/fine/fine.dart';
import 'package:flutter_sample/ui/rain/rain.dart';
import 'package:provider/provider.dart';

enum TabItem { fine, cloud, rain }

Map<TabItem, String> tabName = {
  TabItem.fine: 'fine',
  TabItem.cloud: 'cloud',
  TabItem.rain: 'rain',
};

Map<TabItem, IconData> tabIcon = {
  TabItem.fine: Icons.wb_sunny,
  TabItem.cloud: Icons.cloud,
  TabItem.rain: Icons.beach_access,
};

Map<TabItem, Color> tabColor = {
  TabItem.fine: Colors.deepOrange,
  TabItem.cloud: Colors.green,
  TabItem.rain: Colors.blue,
};

class Home extends StatelessWidget {
  final List<Widget> tabPage = [
    Fine(tabName[TabItem.fine], tabColor[TabItem.fine]),
    Cloud(tabName[TabItem.cloud], tabColor[TabItem.cloud]),
    Rain(tabName[TabItem.rain], tabColor[TabItem.rain]),
  ];

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    return Scaffold(
      body: tabPage[statusProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(TabItem.fine, statusProvider),
          _buildItem(TabItem.cloud, statusProvider),
          _buildItem(TabItem.rain, statusProvider),
        ],
        onTap: (index) => statusProvider.setBottomNavigation(index),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(
      TabItem tabItem, StatusProvider statusProvider) {
    String text = tabName[tabItem];
    IconData icon = tabIcon[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(tabItem, statusProvider),
      ),
      label: text,
    );
  }

  Color _colorTabMatching(TabItem item, StatusProvider statusProvider) {
    return statusProvider.currentTab == item ? tabColor[item] : Colors.grey;
  }
}
