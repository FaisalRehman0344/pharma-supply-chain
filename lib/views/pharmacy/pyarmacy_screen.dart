import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_chain_app/views/pharmacy/nearest_pharmacies.dart';
import 'package:pharma_chain_app/views/pharmacy/saved_pharmacies.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({super.key});

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
            width: 170.w,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: customText(
                    "Saved",
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  child: customText(
                    "Nearest",
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                SavedPharmacyScreen(),
                NearestPharmacyScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
