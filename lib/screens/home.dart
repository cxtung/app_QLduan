// import 'package:buyphone/screens/home.dart';
// import 'package:buyphone/screens/cart.dart';
// import 'package:buyphone/screens/proflie.dart';
import 'package:flutter/material.dart';

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
          // Row(
          //   // children:_buildCategoryChips(), // Hiển thị các tag chọn loại sản phẩm
          // ),
          // SizedBox(width: 8), // Khoảng cách giữa các tag và biểu tượng
          // IconButton(
          //   icon: Icon(Icons.notifications), // Biểu tượng chuông thông báo
          //   onPressed: () {
          //     // Xử lý khi biểu tượng được nhấn
          //   },
        ),
      ],
    );
  }

  // List<Widget> _buildCategoryChips() {
  //   return _categories
  //       .map((category) => Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 4),
  //             child: Chip(
  //               label: Text(category),
  //               backgroundColor: category == _selectedCategory
  //                   ? Colors.blue // Màu nền của tag đã chọn
  //                   : Colors.grey[300], // Màu nền của các tag khác
  //               labelStyle: TextStyle(
  //                 color: category == _selectedCategory
  //                     ? Colors.white // Màu chữ của tag đã chọn
  //                     : Colors.black, // Màu chữ của các tag khác
  //               ),
  //               // onPressed: () {
  //               //   setState(() {
  //               //     _selectedCategory = category; // Cập nhật danh mục được chọn
  //               //   });
  //               // },
  //             ),
  //           ))
  //       .toList();
  // }

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
            title: const Text('Home'),
            onTap: () {
              // Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => ExampleDragAndDrop()));
              //   // Add your logic here for Home
            },
          ),
          ListTile(
            title: const Text('Categories'),
            onTap: () {
              Navigator.pop(context);
              // Add your logic here for About
            },
          ),
          // Add more ListTile widgets for other menu items
          ListTile(
            title: const Text('Cart'),
            onTap: () {
              // Navigator.push(
              // context, MaterialPageRoute(builder: (context) => CartPage()));
              // Add your logic here for About
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ProfilePage()));
              // Add your logic here for About
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              Navigator.pop(context);
              // Add your logic here for About
            },
          ),
          ListTile(
            title: const Text('Terms and conditions'),
            onTap: () {
              Navigator.pop(context);
              // Add your logic here for About
            },
          ),
        ],
      ),
    );
  }

  // Widget _buildContent() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16),
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           SizedBox(
  //               height: 20), // Khoảng cách giữa danh sách sản phẩm và banner
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
                      // Logic khi nhấn nút tham gia
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 83, 237, 243)),
                      foregroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 8, 0, 0)),
                     // Nút có kích thước 1/2.2 chiều rộng màn hình và cao 40
                    ),
                    child: Text('Tham gia'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Logic khi nhấn nút xem
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
