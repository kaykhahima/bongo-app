import 'package:bongo_app/features/home/provider/home_provider.dart';
import 'package:bongo_app/shared/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../shared/widgets/button.dart';
import '../widgets/payment_card_tile.dart';
import '../widgets/payment_method_tile.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Payment'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Total Amount',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
            trailing: Text(
              'TZS 50,000.00',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Gap(12.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Saved Cards',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Consumer<HomeProvider>(builder: (context, provider, _) {
            final savedCards = provider.savedCards;
            return ListView.builder(
              itemCount: savedCards.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final card = savedCards[index];
                return PaymentCardTile(card: card);
              },
            );
          }),
          const Gap(12.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Other Payments',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Consumer<HomeProvider>(builder: (context, provider, _) {
            final methods = provider.paymentMethods;
            return ListView.builder(
              itemCount: methods.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final method = methods[index];
                return PaymentMethodTile(methods: method);
              },
            );
          }),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: PrimaryButton(
              label: 'Proceed',
              onPressed: () {
                context.go('/home');
                Alerts.show(
                  context: context,
                  title: 'Success',
                  message: 'Purchase completed',
                  type: AlertType.info,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
