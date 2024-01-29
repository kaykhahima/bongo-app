import 'package:bongo_app/features/home/models/payment_methods.dart';
import 'package:bongo_app/features/home/provider/the_everything_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({super.key, required this.method});

  final PaymentMethod method;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EverythingProvider>(context, listen: false);

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
                method.logo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            method.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
          trailing: Icon(method.isSelected ? Icons.check : null,
              color: Theme.of(context).colorScheme.primary),
          onTap: () {
            //update selected method
            provider.selectPaymentMethod(method);

            //diselect saved cards
            provider.removeSavedCards();
          },
        ),
        Divider(
          indent: 16.0,
          endIndent: 16.0,
          color: method.isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline,
        ),
      ],
    );
  }
}
