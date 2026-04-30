import 'package:clarity/feature/core/custom_textfromfield.dart';
import 'package:clarity/widgets/custom_elevatedbutton.dart';
import 'package:flutter/material.dart';

class AddtaskScreen extends StatefulWidget {
  const AddtaskScreen({super.key});

  @override
  State<AddtaskScreen> createState() => _AddtaskScreenState();
}

class _AddtaskScreenState extends State<AddtaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text('Add Task', style: TextTheme.of(context).headlineMedium),
      ),
      backgroundColor: Color(0xffFAF8FF),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          spacing: 10,
          children: [
            CustomTextfromfield(title: 'Task Title *'),
            CustomTextfromfield(maxlines: 4, title: 'Description'),
            SizedBox(height: 10),
            CustomTextfromfield(
              title: 'Due Date',
              suffixIcon: Icon(Icons.calendar_today_outlined),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrioritySelector(),
                SizedBox(height: 15),
                CustomTextfromfield(title: 'Tags'),
                SizedBox(height: 25),
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SUGGESTED TASKS'),
                    Row(
                      spacing: 15,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          height: 106,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                height: 32,
                                width: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffDBE1FF),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.mail_outline,
                                      color: Color(0xff004AC6),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text('Email follow-up'),
                                  Text('Work category'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          height: 106,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                height: 32,
                                width: 36,
                                decoration: BoxDecoration(
                                  color: Color(0xffDBE1FF),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.mail_outline,
                                      color: Color(0xff004AC6),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text('Email follow-up'),
                                  Text('Work category'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: TextButton(onPressed: () {}, child: Text('Cancel')),
                ),
                Expanded(
                  child: CustomElevatedbutton(
                    fontsize: 13,
                    title: 'Save Task',
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PrioritySelector extends StatelessWidget {
  const PrioritySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Priority Level'),
        SizedBox(height: 5),
        Row(
          spacing: 5,
          children: [
            Container(
              height: 48,
              width: 100,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Color(0xffF3F3FE),
                border: Border.all(color: Color(0xffC3C6D7)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Color(0xff22C55E),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Text('Low'),
                ],
              ),
            ),
            Container(
              height: 48,
              width: 100,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Color(0xffD0E1FB),
                border: Border.all(color: Color(0xffC3C6D7)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Color(0xffF59E0B),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Text('Medium'),
                ],
              ),
            ),
            Container(
              height: 48,
              width: 100,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Color(0xffF3F3FE),
                border: Border.all(color: Color(0xffC3C6D7)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Color(0xffEF4444),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Text('Hard'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
