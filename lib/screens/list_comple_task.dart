import 'package:flutter/material.dart';

class taskScreen extends StatefulWidget {
  @override
  _taskScreenState createState() => _taskScreenState();
}

class _taskScreenState extends State<taskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: _buildAppBar(),
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
          icon: Icon(Icons.add_box),
          onPressed: () {
            // Xử lý khi biểu tượng được nhấn
          },
        ),
      ],
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
                'Tên người làm:Vũ minh hiếu',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'link:ko có',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'thời gian nộp: 1/12/2024',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ViewTaskScreen()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 83, 237, 243)),
                      foregroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 8, 0, 0)),
                      // Nút có kích thước 1/2.2 chiều rộng màn hình và cao 40
                    ),
                    child: Text('xác nhận hoàn thành'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ViewTaskScreen()));
                      showDialog(
                        context: context,
                        builder: (context) {
                          String? link;
                          return AlertDialog(
                            title: Text('Nhập nhận xét'),
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
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 83, 237, 243)),
                      foregroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 8, 0, 0)),
                      // Nút có kích thước 1/2.2 chiều rộng màn hình và cao 40
                    ),
                    child: Text('yêu cầu sửa'),
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
