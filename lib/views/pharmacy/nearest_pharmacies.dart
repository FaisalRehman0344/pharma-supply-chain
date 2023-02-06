import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/saved_pharmacy_card.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';

class NearestPharmacyScreen extends StatefulWidget {
  const NearestPharmacyScreen({super.key});

  @override
  State<NearestPharmacyScreen> createState() => _NearestPharmacyScreenState();
}

class _NearestPharmacyScreenState extends State<NearestPharmacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
      child: ScrollConfiguration(
        behavior: GlowRemoverBehaviour(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText("Nearest Pharmacies", fontSize: 15.sp),
              pharmacyCard({}),
              pharmacyCard({}),
              pharmacyCard({})
            ],
          ),
        ),
      ),
    );
  }
}
