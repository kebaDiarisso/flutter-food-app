import 'package:flutter/material.dart';
import 'package:testt/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your mealselection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text('Gluten-free'),
                value: _glutenFree,
                subtitle: Text('Only include'),
                onChanged: (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegetarian-free'),
                value: _vegetarian,
                subtitle: Text('Only include'),
                onChanged: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('vegan-free'),
                value: _vegan,
                subtitle: Text('Only include'),
                onChanged: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('lactose-free'),
                value: _lactoseFree,
                subtitle: Text('Only include'),
                onChanged: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              //   _buildSwitchListTile(
              // 'Vegetarian-free',
              // 'Only include vegetarien-free meals',
              //   _vegetarian, (newValue){
              //     setState(() {
              //       _vegetarian = newValue;
              //     });
              //   },
              //   ),
              //   _buildSwitchListTile(
              // 'Vegan-free',
              // 'Only include vegan-free meals',
              //   _vegan, (newValue){
              //     setState(() {
              //       _vegan = newValue;
              //     });
              //   },
              //   ),
            ],
          ))
        ],
      ),
    );
  }
}
