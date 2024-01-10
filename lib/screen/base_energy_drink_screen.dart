import 'package:flutter/material.dart';
import 'package:vsu_project/dto/http/item/energy_drink_slim_dto.dart';
import 'package:vsu_project/screen/energy_drink_screen.dart';

class BaseListEnergyDrinkScreen extends StatefulWidget {
  final Function onFavoriteButtonTap;
  final Function loadData;

  const BaseListEnergyDrinkScreen(
      {super.key, required this.onFavoriteButtonTap, required this.loadData});

  @override
  State<StatefulWidget> createState() => BaseListEnergyDrinkScreenState();
}

class BaseListEnergyDrinkScreenState extends State<BaseListEnergyDrinkScreen> {
  final _scrollController = ScrollController();
  final _list = <EnergyDrinkSlimDto>[];
  final int _pageSize = 10;
  int _currentPage = 0;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchData(_currentPage);
    _scrollController.addListener(_loadMore);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Center(child: Text('Error: $_error'));
    } else {
      return ListView.builder(
        controller: _scrollController,
        itemCount: _list.length + (_isLoading ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          if (index == _list.length) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final element = _list[index];
            return Card(
              child: ListTile(
                title: Text(element.title),
                subtitle: Text(element.subTitle),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnergyDrinkScreen(
                        id: element.id,
                      ),
                    ),
                  );
                },
                trailing: IconButton(
                  onPressed: () {
                    widget.onFavoriteButtonTap(_list, index);
                    // _changeFavoriteStatus(element);
                  },
                  icon: Icon(element.isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded),
                ),
              ),
            );
          }
        },
      );
    }
  }

  // _changeFavoriteStatus(EnergyDrinkSlimDto energyDrinkSlimDto) async {
  //   setState(() {
  //     energyDrinkSlimDto.isFavorite = !energyDrinkSlimDto.isFavorite;
  //   });
  //   await EnergyDrinkService()
  //       .changeFavorite(energyDrinkSlimDto.id, energyDrinkSlimDto.isFavorite);
  // }

  Future<void> _fetchData(int page) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final response = (await widget.loadData(page, _pageSize)).data;
      setState(() {
        _list.addAll(response);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _currentPage++;
      _fetchData(_currentPage);
    }
  }
}
