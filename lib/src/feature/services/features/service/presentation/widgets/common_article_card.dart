import 'package:flutter/material.dart';
import 'package:mama_and_co/features/service/presentation/screens/service_info_screen.dart';

class ArticleCard extends StatelessWidget {
  final String author;
  final String role;
  final String title;

  const ArticleCard({
    super.key,
    required this.author,
    required this.role,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ServiceInfoScreen(),
          ),
        );
      },
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 58,
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                      color: Color(0xffF8FAF),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/img.png'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              author,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffE1E6FF),
                                // light blue background
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Акушер',
                                style: TextStyle(
                                  color: Colors.blue,
                                  // blue text color
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Развитие детей'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('6 месяцев'),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                height: 128,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset('assets/images/img_2.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
