class PaymentMethod {
  final String name;
  final String logo;
  bool isSelected = false;

  PaymentMethod({
    required this.name,
    required this.logo,
    required this.isSelected,
  });
}
