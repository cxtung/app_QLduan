import 'package:flutter/material.dart';
import 'package:quanly_duan/screens/acpbenefit.dart';
import 'package:quanly_duan/screens/list_comple_task.dart';
import 'package:quanly_duan/screens/profile.dart';
import 'package:quanly_duan/screens/screen-manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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
            },
          ),
        ListTile(
            title: const Text('danh sách nhiệm vụ đã nộp'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => taskScreen()));
              // Add your logic here for About
            },
          ),
          ListTile(
            title: const Text('hồ sơ cá nhân'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
              // Add your logic here for About
            },
          ),
          ListTile(
            title: const Text('Quản lí cá nhân'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
              // Add your logic here for About
            },
          ),
          ListTile(
            title: const Text('phê duyệt phúc lợi'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AcpbefenitScreen()));
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
        color: Color.fromARGB(255, 255, 255, 255),
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Tên dự án: dự án 1',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Trưởng dự án: cao xuân tùng',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'Ngày bắt đầu: 1/1/2024',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'Ngày kết thúc: 1/12/2024',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EmployeeListScreen(),
                      ),
                    );
                  },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 83, 237, 243)),
                      foregroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 8, 0, 0)),
                     // Nút có kích thước 1/2.2 chiều rộng màn hình và cao 40
                    ),
                    child: Text('Xem'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Logic khi nhấn nút sửa
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 83, 237, 243)),
                      foregroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 8, 0, 0)),
                     // Nút có kích thước 1/2.2 chiều rộng màn hình và cao 40
                    ),
                    child: Text('Sửa'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Logic khi nhấn nút xóa
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 83, 237, 243)),
                      foregroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 8, 0, 0)),
                     // Nút có kích thước 1/2.2 chiều rộng màn hình và cao 40
                    ),
                    child: Text('Xóa'),
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
