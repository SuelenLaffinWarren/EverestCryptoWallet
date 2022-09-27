// ignore_for_file: public_member_api_docs, sort_constructors_first

class TotalWalletModel {
  String id;
  double cryptoValueWallet;
  TotalWalletModel({
    required this.id,
    required this.cryptoValueWallet,
  });

  @override
  String toString() =>
      'TotalWalletModel(id: $id,cryptoValueWallet: $cryptoValueWallet )';
}
