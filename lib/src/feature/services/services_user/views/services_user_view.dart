import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServicesUserView extends StatelessWidget {
  const ServicesUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              /// #some space
              SizedBox(height: 16),

              /// #knowledge center box
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFE1E6FF),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 205,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Центр знаний',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF4D4DE8),
                            ),
                          ),
                        ),
                        SvgPicture.asset('assets/icons/img_hat.svg'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),

              /// #online consultation box
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFE1E6FF),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 205,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            /// #
                            Expanded(
                              child: SvgPicture.asset(
                                'assets/icons/img_hat.svg',
                              ),
                            ),

                            /// #
                            Text(
                              'Онлайн-консультации',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF4D4DE8),
                              ),
                            ),
                          ],
                        ),

                        /// #
                        Column(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xFFE1E6FF),
                              ),
                              child: SizedBox(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 18,
                                    ),
                                    child: Text(
                                      'Мои записи',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF4D4DE8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E6FF),
                                ),
                                child: SizedBox(
                                  child: Text('Мои записи'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE1E6FF),
                                ),
                                child: SizedBox(
                                  child: Text('Мои записи'),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
