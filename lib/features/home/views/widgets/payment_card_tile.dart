import 'package:bongo_app/features/home/models/saved_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/the_everything_provider.dart';

class PaymentCardTile extends StatelessWidget {
  const PaymentCardTile({super.key, required this.card});

  final SavedCard card;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EverythingProvider>(context, listen: false);

    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.payment_outlined,
            color: card.isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card.cardNumber,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              Text(
                card.cardType,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
            ],
          ),
          trailing: card.isSelected
              ? Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.primary,
                )
              : null,
          onTap: () {
            provider.selectCard(card);
          },
        ),
        Divider(
          indent: 16.0,
          endIndent: 16.0,
          color: card.isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline,
        ),
      ],
    );
  }
}
