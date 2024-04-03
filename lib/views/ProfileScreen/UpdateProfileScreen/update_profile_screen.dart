import 'package:chatter_botique/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.background,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.photo,
                                size: 40,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Personal Info',
                                style: theme.textTheme.labelMedium,
                              ),
                            ],
                          ),
                          _textAndFieldWidget(
                            theme,
                            'Name',
                            Icons.person,
                            'Rasel Ahmed',
                          ),
                          _textAndFieldWidget(
                            theme,
                            'Email',
                            Icons.alternate_email_outlined,
                            'example@gmail.com',
                          ),
                          _textAndFieldWidget(
                            theme,
                            'Phoen number',
                            Icons.phone,
                            '0998833',
                          ),
                          const SizedBox(height: 20,),
                          PrimaryButton(onTap: (){}, btnName: 'Save', icon: Icons.save)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textAndFieldWidget(
    ThemeData theme,
    String title,
    IconData icon,
    String hintText,
  ) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              title,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
          ),
        ),
      ],
    );
  }
}
