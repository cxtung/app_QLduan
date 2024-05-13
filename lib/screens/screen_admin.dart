import 'package:flutter/material.dart';
import 'package:quanly_duan/screens/acpbenefit.dart';
import 'package:quanly_duan/screens/list_comple_task.dart';
import 'package:quanly_duan/screens/listbefenit.dart';
import 'package:quanly_duan/screens/profile.dart';
import 'package:quanly_duan/screens/screen-manager.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen>
    with TickerProviderStateMixin {
  final GlobalKey _draggableKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildMenuItem(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Color.fromARGB(255, 5, 5, 5)),
      backgroundColor: const Color(0xFFF7F7F7),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.add_box), // Biểu tượng chuông thông báo
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddBefenit(),
              ),
            );
            // Xử lý khi biểu tượng được nhấn
          },
        ),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Trang chủ'),
            onTap: () {
              // Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => ExampleDragAndDrop()));
              //   // Add your logic here for Home
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminScreen()));
            },
          ),
          
          ListTile(
            title: const Text('phúc lợi'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminScreen()));
              // Add your logic here for About
            },
          ),
          
        ],
      ),
    );
  }

  Widget _buildMenuItem() {
    return IntrinsicHeight(
      child: Card(
        elevation: 5,
        color: Color.fromARGB(255, 113, 246, 243),
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Tên phúc lợi: phúc lợi 1',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
                Container(
              margin: EdgeInsets.only(left: 8), // Lùi vào 1 tí
              child: Text(
                'Thông tin phúc lợi: tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích ...',
                style: TextStyle(
                  fontSize: 15,
                ),
                maxLines: 2, // Số dòng tối đa
                overflow: TextOverflow.ellipsis,
              ),
            ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewBefenitScreen(),
                          ),
                        );
                      }),
                  IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditBefenitScreen(),
                          ),
                        );
                      }),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddBefenit extends StatefulWidget {
  @override
  _AddBefenitState createState() => _AddBefenitState();
}

class _AddBefenitState extends State<AddBefenit> {
  String _name = '';
  String _position = '';
  String _role = 'Nhân viên';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm Phúc lợi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tên phúc lợi',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.95),
              ),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: 'Mô tả quyền phúc lợi:',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.95,
                    maxHeight: MediaQuery.of(context).size.height * 10.5),
              ),
              onChanged: (value) {
                setState(() {
                  _position = value;
                });
              },
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 83, 237, 243)),
                foregroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 8, 0, 0)),
               minimumSize: MaterialStateProperty.all(Size(
                  MediaQuery.of(context).size.width * 0.95,
                  40)), // Nút có kích thước 1/2.2 chiều rộng màn hình và cao 40
              ),
              onPressed: () {
                // Add your logic to add the employee to the project
                // You can use _name, _position, and _role variables here
                Navigator.pop(context);
              },
              child: Text('Thêm phúc lợi'),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewBefenitScreen extends StatefulWidget {
  ViewBefenitScreen();

  @override
  _ViewBefenitScreenState createState() => _ViewBefenitScreenState();
}

class _ViewBefenitScreenState extends State<ViewBefenitScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xem phúc lợi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('tên Phúc lợi: phúc lợi 1',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold,),),
            SizedBox(height: 16),
              Container(
              margin: EdgeInsets.only(left: 8), // Lùi vào 1 tí
              child: Text(
                'Thông tin phúc lợi: tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích tẩn hưởng phúc lợi thật là thích ',
                style: TextStyle(
                  fontSize: 15,
                ),
               
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditBefenitScreen extends StatefulWidget {

  EditBefenitScreen();

  @override
  _EditBefenitScreenState createState() => _EditBefenitScreenState();
}

class _EditBefenitScreenState extends State<EditBefenitScreen> {
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sửa Phúc lợi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tên phúc lợi',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.95),
              ),
              onChanged: (value) {
               
              },
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: 'Mô tả quyền phúc lợi:',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.95,
                    maxHeight: MediaQuery.of(context).size.height * 10.5),
              ),
              onChanged: (value) {
                
              },
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 83, 237, 243)),
                foregroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 8, 0, 0)),
                minimumSize: MaterialStateProperty.all(Size(
                  MediaQuery.of(context).size.width * 0.95,
                  40)),  // Nút có kích thước 1/2.2 chiều rộng màn hình và cao 40
              ),
              onPressed: () {
                // Add your logic to add the employee to the project
                // You can use _name, _position, and _role variables here
                Navigator.pop(context);
              },
              child: Text('Thêm phúc lợi'),
            ),
          ],
        ),
      ),
    );
  }
}
