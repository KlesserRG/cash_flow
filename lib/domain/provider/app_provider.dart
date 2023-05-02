import 'package:flutter/cupertino.dart';
import 'package:text_rpg_two/domain/hive/data_item_type.dart';
import 'package:text_rpg_two/domain/hive/hive_boxes.dart';
import 'package:text_rpg_two/ui/theme/app_icons.dart';
import 'package:text_rpg_two/ui/theme/seasons/seasons.dart';
import 'package:text_rpg_two/ui/theme/seasons/seasons_path.dart';

class AppProvider extends ChangeNotifier {
  // Тема приложения
  late Season _currentTheme;
  Season get currentTheme => _currentTheme;

  // Все данные
  late List<DataItemType> _data;
  List<DataItemType> get data => _data;

  // Данные сортировки
  late List<DataItemType> _sortedData;
  List<DataItemType> get sortedData => _sortedData;

  // Выбранное пользователем время
  DateTime currentTime = DateTime.now();

  // Условия сортировки
  bool isCash = false;
  bool isCard = false;
  bool isHome = false;
  bool isShop = false;
  bool isCar = false;
  bool isWeb = false;
  bool isGift = false;
  bool isBeach = false;

  // Статистика
  double homeStat = 0;
  double shopStat = 0;
  double carStat = 0;
  double webStat = 0;
  double giftStat = 0;
  double beachStat = 0;

  // Авто определение темы на основе времени года
  void takeTheme() {
    DateTime now = DateTime.now();
    switch (now.month) {
      case 1:
        _currentTheme = Seasons.allSeasons[SeasonsPath.winter]!;
        break;
      case 2:
        _currentTheme = Seasons.allSeasons[SeasonsPath.spring]!;
        break;
      case 3:
        _currentTheme = Seasons.allSeasons[SeasonsPath.spring]!;
        break;
      case 4:
        _currentTheme = Seasons.allSeasons[SeasonsPath.spring]!;
        break;
      case 5:
        _currentTheme = Seasons.allSeasons[SeasonsPath.summer]!;
        break;
      case 6:
        _currentTheme = Seasons.allSeasons[SeasonsPath.summer]!;
        break;
      case 7:
        _currentTheme = Seasons.allSeasons[SeasonsPath.summer]!;
        break;
      case 8:
        _currentTheme = Seasons.allSeasons[SeasonsPath.autumn]!;
        break;
      case 9:
        _currentTheme = Seasons.allSeasons[SeasonsPath.autumn]!;
        break;
      case 10:
        _currentTheme = Seasons.allSeasons[SeasonsPath.autumn]!;
        break;
      case 11:
        _currentTheme = Seasons.allSeasons[SeasonsPath.winter]!;
        break;
      default:
        _currentTheme = Seasons.allSeasons[SeasonsPath.winter]!;
    }
  }

  // Установка темы вручную
  void setTheme(String theme) {
    if (theme == SeasonsPath.spring) {
      _currentTheme = Seasons.allSeasons[theme]!;
      notifyListeners();
      return;
    }
    if (theme == SeasonsPath.summer) {
      _currentTheme = Seasons.allSeasons[theme]!;
      notifyListeners();
      return;
    }
    if (theme == SeasonsPath.autumn) {
      _currentTheme = Seasons.allSeasons[theme]!;
      notifyListeners();
      return;
    }
    if (theme == SeasonsPath.winter) {
      _currentTheme = Seasons.allSeasons[theme]!;
      notifyListeners();
      return;
    }
    _currentTheme = Seasons.allSeasons[SeasonsPath.winter]!;
  }

  // Обновление главной базы данных
  void putData() {
    _data = HiveBoxes.dataItemType.values.toList();
  }

  // Добавление в главную базу данных
  void insertData(DataItemType item, int index){
    if (index == -1) {
      HiveBoxes.dataItemType.add(item);
      putData();
      firstSorting();
      notifyListeners();
      return;
    }
    HiveBoxes.dataItemType.putAt(index, item);
    putData();
    firstSorting();
    notifyListeners();
  }

  // Удаление элемента из базы данных
  void deleteData(int index){
    HiveBoxes.dataItemType.deleteAt(index);
    putData();
    firstSorting();
    notifyListeners();
  }

  // Сумма на основе главной базы данных
  double calculateSum() {
    double sum = 0;
    for (int i = 0; i < _data.length; i++) {
      sum += _data[i].balance;
    }
    return sum;
  }

  // Проверка наличия условий
  bool chechOptions(){
    if (isHome || isBeach || isCar || isGift || isShop || isWeb) {
      return true;
    }
    return false;
  }

  // Сумма сортировки
  double sortedSum(){
    double sum = 0;
    for (var i = 0; i < _sortedData.length; i++) {
      sum += _sortedData[i].balance;
    }
    return sum;
  }


  // Без сортировки
  void firstSorting() {
    _sortedData = _data;
  }

  // Сортировка
  void sorting() {
    _sortedData = [];
    bool checker = false;
    int max = _data.length;

    //////
    if (isCash == false && isCard == false) {
      _sortedData = _data;
      notifyListeners();
    }

    checker = chechOptions();

    if (checker == true && isCash == false && isCard == false) {
      _sortedData = [];
      for (var i = 0; i < max; i++) {
        if (isHome && _data[i].icon == AppIcons.homeIcon) {
          _sortedData.add(_data[i]);
          continue;
        }
        if (isShop && _data[i].icon == AppIcons.shopIcon) {
          _sortedData.add(_data[i]);
          continue;
        }
        if (isCar && _data[i].icon == AppIcons.carIcon) {
          _sortedData.add(_data[i]);
          continue;
        }
        if (isWeb && _data[i].icon == AppIcons.webIcon) {
          _sortedData.add(_data[i]);
          continue;
        }
        if (isGift && _data[i].icon == AppIcons.giftIcon) {
          _sortedData.add(_data[i]);
          continue;
        }
        if (isBeach && _data[i].icon == AppIcons.beachIcon) {
          _sortedData.add(_data[i]);
          continue;
        }
      }
      notifyListeners();
      return;
    }

    //////
    if (isCard) {
      for (int i = 0; i < _data.length; i++) {
        if (_data[i].isCash == isCard) {
          continue;
        }
        if (isHome && _data[i].icon == AppIcons.homeIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (isShop && _data[i].icon == AppIcons.shopIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (isCar && _data[i].icon == AppIcons.carIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (isWeb && _data[i].icon == AppIcons.webIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (isGift && _data[i].icon == AppIcons.giftIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (isBeach && _data[i].icon == AppIcons.beachIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (checker == false) {
          _sortedData.add(_data[i]);
          continue;
        }
      }
      notifyListeners();
      return;
    }

    ////////
    if (isCash) {
      for (int i = 0; i < _data.length; i++) {
        if (_data[i].isCash == !isCash) {
          continue;
        }
        if (isHome && _data[i].icon == AppIcons.homeIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (isShop && _data[i].icon == AppIcons.shopIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (isCar && _data[i].icon == AppIcons.carIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (isWeb && _data[i].icon == AppIcons.webIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (isGift && _data[i].icon == AppIcons.giftIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (isBeach && _data[i].icon == AppIcons.beachIcon) {
          checker = true;
          _sortedData.add(_data[i]);
          continue;
        }
        if (checker == false) {
          _sortedData.add(_data[i]);
          continue;
        }
      }
      notifyListeners();
      return;
    }
  }

  void statistic() {
    homeStat = 0;
    shopStat = 0;
    carStat = 0;
    webStat = 0;
    giftStat = 0;
    beachStat = 0;
    for (var i = 0; i < _data.length; i++) {
      if (_data[i].icon == AppIcons.homeIcon) {
        homeStat += _data[i].balance;
        continue;
      }
      if (_data[i].icon == AppIcons.shopIcon) {
        shopStat += _data[i].balance;
        continue;
      }
      if (_data[i].icon == AppIcons.carIcon) {
        carStat += _data[i].balance;
        continue;
      }
      if (_data[i].icon == AppIcons.webIcon) {
        webStat += _data[i].balance;
        continue;
      }
      if (_data[i].icon == AppIcons.giftIcon) {
        giftStat += _data[i].balance;
        continue;
      }
      if (_data[i].icon == AppIcons.beachIcon) {
        beachStat += _data[i].balance;
        continue;
      }
    }
  }
}
