import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

class _Doc {
  final String title;
  final Function() onTap;

  _Doc({required this.title, required this.onTap});
}

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
            _Doc(
                title: t.docs.privacyPolicy,
                onTap: () {
                  context.pushNamed(AppViews.pdfView, extra: {
                    'path': Assets.docs.mobileApplicationPrivacyPolicy,
                  });
                }),
            _Doc(
                title: t.docs.userAgreement,
                onTap: () {
                  context.pushNamed(AppViews.pdfView, extra: {
                    'path': Assets.docs.userAgreement,
                  });
                }),
            _Doc(
                title: t.docs.aboutTheCompany,
                onTap: () {
                  context.pushNamed(AppViews.pdfView, extra: {
                    'path': Assets.docs.consentToProcessPersonalDataMP,
                  });
                }),
          ].map((e) {
            return DocWidget(
              title: e.title,
              onTap: e.onTap,
            );
          }).toList(),
        ),
      ),
    );
  }
}
