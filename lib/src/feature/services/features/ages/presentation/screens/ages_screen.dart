import 'package:flutter/material.dart';
import 'package:mama_and_co/features/ages/presentation/widgets/ages_widgets.dart';

class AgesScreen extends StatelessWidget {
  const AgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Возраст',
          style: TextStyle(
            color: Color(0xff4D4DE8),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: const [
                    AgeSelection(
                      title: 'Первый месяц',
                      count: 3,
                    ),
                    AgeSelection(
                      title: '2 месяца',
                      count: 3,
                    ),
                    AgeSelection(
                      title: '3 месяца',
                      count: 3,
                    ),
                    AgeSelection(
                      title: '4 месяца',
                      count: 3,
                    ),
                    AgeSelection(
                      title: '5 месяцев',
                      count: 3,
                    ),
                    AgeSelection(
                      title: '6 месяцев',
                      count: 3,
                    ),
                    AgeSelection(
                      title: '12 месяцев',
                      count: 3,
                    ),
                    AgeSelection(
                      title: 'После года',
                      count: 3,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffCED1D9),
                        fixedSize: Size(109, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Очистить',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffE1E6FF),
                          fixedSize: Size(241, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: Color(0xff4D4DE8)),
                      child: Text('Подтвердить'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
