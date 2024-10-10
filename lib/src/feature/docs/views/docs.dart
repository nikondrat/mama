import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class DocsView extends StatelessWidget {
  const DocsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(
          isShowTitle: false,
        ),
        title: Text(t.docs.termsOfUse),
        centerTitle: false,
        leadingWidth: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            t.docs.privacyPolicy,
            t.docs.userAgreement,
            t.docs.aboutTheCompany,
          ].map((e) {
            return DocWidget(
              title: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}
