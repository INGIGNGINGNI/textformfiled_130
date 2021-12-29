import 'package:flutter/material.dart';
import 'package:textformfield_130/models/food.dart';
import 'package:textformfield_130/models/subject.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  String? foodValue;
  late List<Food> foods;
  late List<Subject> subjects;
  late List<ListItem> dropdownItems = ListItem.getlistItem();
  late List<DropdownMenuItem<ListItem>> dropdownMenuItems;
  late ListItem _selectedItem;

  List selectedSubject = [];

  @override
  void initState() {
    super.initState();
    foods = Food.getfood();
    subjects = Subject.getsubject();
    dropdownMenuItems = createDropdownMenu(dropdownItems);
    _selectedItem = dropdownMenuItems[0].value!;
    // print(foods);
  }

  List<DropdownMenuItem<ListItem>> createDropdownMenu(
      List<ListItem> dropdownItems) {
    List<DropdownMenuItem<ListItem>> items = [];

    for (var item in dropdownItems) {
      items.add(
        DropdownMenuItem(
          child: Text(item.name!),
          value: item,
        ),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  username(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  password(),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  radiobtn(),
                  Text(
                    'Item Selected : $foodValue',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                    ),
                  ),
                  checkbox(),
                  dropdownbtn(),
                  Text(
                    'Item selected : ' +
                        // _selectedItem.value!.toString() +
                        _selectedItem.name!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                    ),
                  ),
                  submit(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownButton<ListItem> dropdownbtn() {
    return DropdownButton(
      value: _selectedItem,
      items: dropdownMenuItems,
      onChanged: (ListItem? value) {
        setState(() {
          _selectedItem = value as ListItem;
        });
      },
    );
  }

  Column checkbox() {
    return Column(
      children: createSubjectCheckbox(),
    );
  }

  Column radiobtn() {
    return Column(
      children: createFoodRadio(),
    );
  }

  Widget submit() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print(_usernamecontroller.text);
            print(_passwordcontroller.text);
          }
          return null;
        },
        child: const Text(
          'submit',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  TextFormField password() {
    return TextFormField(
      controller: _passwordcontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Password';
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.deepPurple,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  TextFormField username() {
    return TextFormField(
      controller: _usernamecontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Username';
        }
        return null;
      },
      // obscureText: true,
      //ใช้ในกรณีที่ทำ input password
      decoration: const InputDecoration(
        labelText: 'Username',
        // icon: Icon(Icons.person),
        // ไอคอนอยู่นอกกล่องข้อความ
        prefixIcon: Icon(Icons.account_box),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------------------------------------------

  List<Widget> createFoodRadio() {
    List<Widget> listRadiofood = [];

    for (var food in foods) {
      listRadiofood.add(
        RadioListTile<dynamic>(
          title: Text(food.thName!),
          subtitle: Text(food.enName!),
          secondary: Text(food.price!.toString() + ' THB.'),
          value: food.foodvalue,
          groupValue: foodValue,
          onChanged: (value) {
            setState(() {
              foodValue = value.toString();
            });
          },
        ),
      );
    }
    return listRadiofood;
  }

  List<Widget> createSubjectCheckbox() {
    List<Widget> listCheckboxSubject = [];

    for (var subject in subjects) {
      listCheckboxSubject.add(
        CheckboxListTile(
          title: Text(subject.subName!),
          subtitle: Text('credit: ${subject.credit}'),
          value: subject.checked,
          onChanged: (value) {
            setState(() {
              subject.checked = value!;
              print(value);
            });
            if (value!) {
              selectedSubject.add(subject.subName!);
            } else {
              selectedSubject.remove(subject.subName!);
            }
            print(selectedSubject);
          },
        ),
      );
    }
    return listCheckboxSubject;
  }
}

class ListItem {
  int? value;
  String? name;

  ListItem(this.value, this.name);
  static List<ListItem> getlistItem() {
    return [
      ListItem(1, 'Item 1'),
      ListItem(2, 'Item 2'),
      ListItem(3, 'Item 3'),
    ];
  }
}
