import 'package:flutter/material.dart';
import 'package:quanly_duan/screens/profile.dart';
import 'package:quanly_duan/screens/screen-manager.dart';

class HomeScreenemployee extends StatefulWidget {
  const HomeScreenemployee({super.key});

  @override
  State<HomeScreenemployee> createState() => _HomeScreenemployeeState();
}

class _HomeScreenemployeeState extends State<HomeScreenemployee>
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
          icon: Icon(Icons.notifications),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreenemployee()));
              // Add your logic here for Home
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
            title: const Text('phúc lợi'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
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
                'Nhiệm vụ: thiết kế giao diện ứng dụng',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Trưởng dự án: cao xuân tùng',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Mô tả: thiết kế trang người dùng trang chi tiết sản phẩm thiết kế trang người dùng trang chi tiết sản phẩm thiết kế trang người dùng trang chi tiết sản phẩmthiết kế trang người dùng trang chi tiết sản phẩmthiết kế trang người dùng trang chi tiết sản phẩmthiết kế trang người dùng trang chi tiết sản phẩmthiết kế trang người dùng trang chi tiết sản phẩm',
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
                              builder: (context) => ViewTaskScreen()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 83, 237, 243)),
                      foregroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 8, 0, 0)),
                      // Nút có kích thước 1/2.2 chiều rộng màn hình và cao 40
                    ),
                    child: Text('Xem chi tiết'),
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

class ViewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chi tiết công việc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nhiệm vụ: thiết kế giao diện ứng dụng',
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16),
            Text('Quản lí dự án: Cao xuân tùng',
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 16),
            Text(
              'Mô tả: thiết kế trang người dùng trang chi tiết sản phẩm thiết kế trang người dùng trang chi tiết sản phẩm thiết kế trang người dùng trang chi tiết sản phẩmthiết kế trang người dùng trang chi tiết sản phẩmthiết kế trang người dùng trang chi tiết sản phẩmthiết kế trang người dùng trang chi tiết sản phẩmthiết kế trang người dùng trang chi tiết sản phẩm',
            ),
            SizedBox(height: 16),
            Text(
              'Đánh giá: Không có',
            ),
            SizedBox(height: 16),
            Text(
              'Trạng thái: Đang làm',
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Show a dialog to enter the link
                showDialog(
                  context: context,
                  builder: (context) {
                    String? link;
                    return AlertDialog(
                      title: Text('Nhập đường dẫn'),
                      content: TextField(
                        onChanged: (value) {
                          link = value;
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Send the link to the server
                            //...
                            Navigator.pop(context);
                          },
                          child: Text('Gửi'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('nộp công việc'),
            ),
          ],
        ),
      ),
    );
  }
}
