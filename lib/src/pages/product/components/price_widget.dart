import 'package:flutter/material.dart';
import 'package:gopizza/src/models/product.dart';
import 'package:gopizza/src/services/utils_services.dart';

class PriceWidget extends StatefulWidget {
  const PriceWidget({super.key, required this.product});
  final Product product;

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  UtilsServices utilsServices = UtilsServices();

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            value: 1,
            groupValue: _value,
            onChanged: (val) => {
              setState(() => _value = val as int),
              setPrice(widget.product, widget.product.price.small)
            },
            title: Text(
              utilsServices.priceToCurrency(
                widget.product.price.small,
              ),
            ),
            subtitle: const Text("Pequena"),
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: 2,
            groupValue: _value,
            onChanged: (val) => {
              setState(() => _value = val as int),
              setPrice(widget.product, widget.product.price.large)
            },
            title: Text(
              utilsServices.priceToCurrency(
                widget.product.price.large,
              ),
            ),
            subtitle: const Text("Grade"),
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: 3,
            groupValue: _value,
            onChanged: (val) => {
              setState(() => _value = val as int),
              setPrice(widget.product, widget.product.price.extraLarge)
            },
            title: Text(
              utilsServices.priceToCurrency(
                widget.product.price.extraLarge,
              ),
            ),
            subtitle: const Text("Gigante"),
          ),
        ],
      ),
    );
  }
}

void setPrice(Product product, double value) {
  product.choosedSize = value;
}
