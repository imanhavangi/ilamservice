class ServiceOrProduct {
  /// if [type] = 0 then it's a service, else if [type] = 1, it's a product.
  /// [fileName] would be [Null] if there's no image.
  /// [price] would be [Null] if there's no defined price.
  final int type;
  final int id;
  final int fatherId;
  final String name;
  final String? fileName;
  final int? price;
  ServiceOrProduct({
    required this.type,
    required this.id,
    required this.fatherId,
    required this.name,
    this.fileName,
    this.price,
  });
}
