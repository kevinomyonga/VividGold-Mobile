class PaymentMethod {
  final int pMethodValue;
  final String pMethodIcon;
  final String pMethodName;

  PaymentMethod({
    this.pMethodValue,
    this.pMethodIcon,
    this.pMethodName,
  });

  static List<PaymentMethod> getPaymentMethods() {
    return <PaymentMethod>[
      PaymentMethod(pMethodValue: 0, pMethodName: 'M-Pesa',),
      PaymentMethod(pMethodValue: 1, pMethodName: 'Pesapal',),
      PaymentMethod(pMethodValue: 2, pMethodName: 'Wallet / UPI',),
      PaymentMethod(pMethodValue: 3, pMethodName: 'Net Banking',),
      PaymentMethod(pMethodValue: 4, pMethodName: 'Credit / Debit / ATM Card',),
      PaymentMethod(pMethodValue: 5, pMethodName: 'Cash on Delivery',),
    ];
  }
}
