import 'package:bongo_app/features/home/models/payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({super.key, required this.methods});

  final PaymentMethod methods;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 45.0,
            width: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                methods.logo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            methods.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).colorScheme.outline,
          ),
          onTap: () {},
        ),
        Divider(
          indent: 16.0,
          endIndent: 16.0,
          color: Theme.of(context).colorScheme.outline,
        ),
        const Gap(10.0),
      ],
    );
  }
}
