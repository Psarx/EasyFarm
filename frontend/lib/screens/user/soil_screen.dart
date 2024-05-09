import 'package:flutter/material.dart';

class SoilTypesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soil Types'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg2.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSoilTypeButton(context, 'Clay'),
              _buildSoilTypeButton(context, 'Sandy'),
              _buildSoilTypeButton(context, 'Loamy'),
              _buildSoilTypeButton(context, 'Silty'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSoilTypeButton(BuildContext context, String soilType) {
    return Column(
      children: [
        SizedBox(height: 20), // Add vertical gap above the button
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SoilDefinitionScreen(soilType),
              ),
            );
          },
          child: Text(
            soilType,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class SoilDefinitionScreen extends StatelessWidget {
  final String soilType;

  SoilDefinitionScreen(this.soilType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(soilType + ' Definition'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg2.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            _getSoilDefinition(
                soilType), // Using the updated _getSoilDefinition method
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  String _getSoilDefinition(String soilType) {
    switch (soilType) {
      case 'Clay':
        return 'Clay soil is composed of tiny particles and has poor drainage.\n\n' +
            'Types of crops grown in clay soil:\n' +
            '- Vegetables: broccoli, cauliflower, kale, peas, potatoes, cabbage, and Brussels sprouts\n' +
            '- Leafy crops\n' +
            '- Fruit trees\n' +
            '- Perennials\n' +
            '- Ornamental plants\n' +
            '- Shrubs: aster, Helen’s flower, flowering quince\n\n' +
            'Types of crops difficult to grow in clay soil:\n' +
            '- Root vegetables like parsnips and carrots\n' +
            '- Soft berries\n' +
            '- Desert and other plants that need fast draining.';
      case 'Sandy':
        return 'Sandy soil has large particles and drains quickly, but lacks nutrients.\n\n' +
            'Types of crops grown in sandy soil:\n' +
            '- Commercially cultivated plants: collard greens, tomatoes, melons, squash, strawberries, sugarbeet, lettuce, peppers\n' +
            '- Plants with good irrigation: maize, millet, barley\n' +
            '- Root vegetables: potatoes, parsnips, carrots\n' +
            '- Shrubs and bulbs: tulips, tree mallow, sun roses, hibiscus\n' +
            '- Herbs native to Mediterranean climates: oregano, rosemary, lavender\n\n' +
            'Types of crops difficult to grow in sandy soil:\n' +
            '- Brassicas like broccoli and cabbage\n' +
            '- Peas and beans.';
      case 'Loamy':
        return 'Loamy soil is a mixture of sand, silt, and clay, providing good drainage and fertility.\n\n' +
            'Types of crops grown in loamy soil:\n' +
            '- Most vegetables\n' +
            '- Root crops\n' +
            '- Wheat\n' +
            '- Cotton\n' +
            '- Most fruits\n' +
            '- Berries\n' +
            '- Climbing plants\n' +
            '- Flowers: roses, irises, gladiolus, lilies\n\n' +
            'Types of crops difficult to grow in loamy soil:\n' +
            '- Tomatoes (seedling stage onward)\n' +
            '- Green beans\n' +
            '- Brassicas: late-growing cabbage\n' +
            '- Cacti and other desert plants.';
      case 'Silty':
        return 'Silty soil has medium-sized particles and holds moisture well.\n\n' +
            'Types of crops grown in silty soil:\n' +
            '- Most vegetables\n' +
            '- Climbing plants\n' +
            '- Perennials\n' +
            '- Grasses\n' +
            '- Shrubs\n' +
            '- Trees: willow, birch, dogwood\n\n' +
            'Types of crops difficult to grow in silty soil:\n' +
            '- Root vegetables, including parsnips and carrots\n' +
            '- Desert and other plants that need fast draining.';
      case 'Chalky':
        return 'Chalky soil contains a lot of lime, making it alkaline.\n\n' +
            'Types of crops grown in chalky soil:\n' +
            '- Vegetables: spinach, beets, cabbage, sweet corn\n' +
            '- Flowers: lilac, weigela, madonna lilies, mock oranges, Californian poppies, wallflowers\n' +
            '- Climbing plants: akebia, clematis, grape vines, ivy, jasmine, lonicera, Virginia creeper\n' +
            '- Trees and bushes\n\n' +
            'Types of crops difficult to grow in chalky soil:\n' +
            '- Berries such as blueberries and raspberries\n' +
            '- Tomatoes.';
      default:
        return '';
    }
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SoilTypesScreen(),
  ));
}
