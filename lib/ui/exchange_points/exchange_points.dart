import 'package:flutter/material.dart';
import 'package:waste_managament/ui/exchange_points/widgets/point_banner.dart';

class ExchangePoints extends StatefulWidget {
  const ExchangePoints({super.key});

  @override
  _ExchangePointsState createState() => _ExchangePointsState();
}

class _ExchangePointsState extends State<ExchangePoints>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int selectedAmountIndex = 0;
  int _currentIndex = 0;

  final List<String> tabs = ['gopay', 'OVO', 'ShopeePay', 'DANA'];

  final List<Color> bannerColors = [
    Color(0xFF01AED6)!,
    Color(0xFF4E3394)!,
    Color(0xFFEE4E2C)!,
    Color(0xFF008CEB)!,
  ];

  final List<Map<String, dynamic>> amounts = [
    {'amount': 'Rp 10000', 'point': '10100 Poin'},
    {'amount': 'Rp 20000', 'point': '20100 Poin'},
    {'amount': 'Rp 50000', 'point': '50100 Poin'},
    {'amount': 'Rp 100000', 'point': '100100 Poin'},
    {'amount': 'Rp 200000', 'point': '200100 Poin'},
    {'amount': 'Rp 500000', 'point': '500100 Poin'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _currentIndex = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color bannerColor = bannerColors[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Thay đổi điểm'),
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: TabBar(
              controller: _tabController,
              isScrollable: false,
              indicatorColor: bannerColor,
              indicatorWeight: 3,
              labelColor: bannerColor,
              unselectedLabelColor: Colors.black54,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: tabs.map((e) => Tab(text: e)).toList(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((tab) {
          return _buildTabContent(bannerColor);
        }).toList(),
      ),
    );
  }

  Widget _buildTabContent(Color bannerColor) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PointBanner(color: bannerColor, totalPoints: 16500),
          SizedBox(height: 16),
          Text('Số điện thoại di động',
              style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: '08XX-XXXX-XXXX',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 24),
          Text('Chọn mệnh giá',
              style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 12),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: amounts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              final isSelected = index == selectedAmountIndex;
              final item = amounts[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAmountIndex = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                      isSelected ? bannerColor : Colors.grey[300]!,
                      width: isSelected ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['amount'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text(
                        item['point'],
                        style: TextStyle(
                          color: isSelected ? bannerColor : Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 24),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: bannerColor,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  backgroundColor: Colors.white,
                  builder: (context) {
                    return DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.5, // Chiếm nửa màn hình
                      maxChildSize: 0.9,
                      minChildSize: 0.3,
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: 40,
                                    height: 4,
                                    margin: EdgeInsets.only(bottom: 16),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                                Text("Xác nhận đổi điểm", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                SizedBox(height: 12),
                                Text("Bạn có chắc muốn đổi ${amounts[selectedAmountIndex]['amount']} cho ví ${tabs[_currentIndex]} không?"),
                                SizedBox(height: 24),
                                ElevatedButton(
                                  onPressed: () {
                                    // Xử lý xác nhận tại đây
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: bannerColors[_currentIndex],
                                  ),
                                  child: Center(child: Text("Xác nhận")),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Tiếp tục'),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
