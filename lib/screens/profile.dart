import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hồ sơ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_picture.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Họ và tên: John Doe',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            
            Text(
              'Email: john.doe@example.com',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
      
            Text(
              'Số điện thoại:0123456789',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 20),
            Text(
              'Địa chỉ: 123 Main St, Thành phố, Quốc gia',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
           
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Add logout functionality
                  },
                  child: Text('Đăng Xuất'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  },
                  child: Text('Chỉnh sửa thông tin'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh sửa Hồ sơ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Họ và tên',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Nhập họ và tên',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Nhập email',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Số điện thoại',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: 'Nhập số điện thoại',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Địa chỉ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: 'Nhập địa chỉ',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add update profile functionality
                },
                child: Text('Lưu thay đổi'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
