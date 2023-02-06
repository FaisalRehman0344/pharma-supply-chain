import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/saved_pharmacy_card.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';

class SavedPharmacyScreen extends StatefulWidget {
  const SavedPharmacyScreen({super.key});

  @override
  State<SavedPharmacyScreen> createState() => _SavedPharmacyScreenState();
}

class _SavedPharmacyScreenState extends State<SavedPharmacyScreen> {
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
              customText("Saved pharmacies", fontSize: 15.sp),
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
