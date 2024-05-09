import 'package:flutter/material.dart';

class Employee {
  final String name;
  final String position;
  final List<Task> tasks;

  Employee({required this.name, required this.position, required this.tasks});
}

class Task {
  final String name;
  final String description;

  Task({required this.name, required this.description});
}

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Employee> employees = [
    Employee(
      name: 'John Doe',
      position: 'Developer',
      tasks: [
        Task(name: 'Task 3', description: 'Description for Task 3'),
        Task(name: 'Task 4', description: 'Description for Task 4'),
      ],
    ),
    Employee(
      name: 'Jane Smith',
      position: 'Designer',
      tasks: [
        Task(name: 'Task 3', description: 'Description for Task 3'),
        Task(name: 'Task 4', description: 'Description for Task 4'),
      ],
    ),
    Employee(
      name: 'Alex Johnson',
      position: 'Manager',
      tasks: [
        Task(name: 'Task 3', description: 'Description for Task 3'),
        Task(name: 'Task 4', description: 'Description for Task 4'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dự án 1'),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return EmployeeCard(
            employee: employees[index],
            onDelete: () {
              setState(() {
                employees.removeAt(index);
              });
            },
            onEdit: () {
              // Add your logic here for editing employee
            },
            onView: () {
              // Add your logic here for viewing employee
            },
            onAssignTask: () {
              // Add your logic here for viewing employee
            },
            onAddEmployee: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddEmployeeScreen()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddEmployeeScreen()),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onView;
  final VoidCallback onAssignTask;
  final VoidCallback
      onAddEmployee; // Hàm được gọi khi nhấn vào icon để thêm nhân viên

  EmployeeCard({
    required this.employee,
    required this.onDelete,
    required this.onEdit,
    required this.onView,
    required this.onAssignTask,
    required this.onAddEmployee,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      elevation: 5,
      child: Column(
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(employee.name),
                SizedBox(height: 5),
                Text(employee.position),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ViewEmployeeScreen(employee: employee),
                      ),
                    );
                  }),
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditEmployeeScreen(employee: employee),
                      ),
                    );
                  }),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: onDelete,
              ),
              IconButton(
                  icon: Icon(Icons.assignment),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AssignmentScreen(employee: employee),
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class AddEmployeeScreen extends StatefulWidget {
  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  String _name = '';
  String _position = '';
  String _role = 'Nhân viên';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm Nhân Viên'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Thông Tin Nhân Viên:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(labelText: 'Tên Nhân Viên'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(labelText: 'Vị Trí'),
              onChanged: (value) {
                setState(() {
                  _position = value;
                });
              },
            ),
            SizedBox(height: 15),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Add your logic to add the employee to the project
                // You can use _name, _position, and _role variables here
                Navigator.pop(context);
              },
              child: Text('Thêm Nhân Viên'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditEmployeeScreen extends StatefulWidget {
  final Employee employee;

  EditEmployeeScreen({required this.employee});

  @override
  _EditEmployeeScreenState createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _position;

  @override
  void initState() {
    super.initState();
    _name = widget.employee.name;
    _position = widget.employee.position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sửa thông tin nhân viên'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                  labelText: 'Tên nhân viên',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.95),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'vui lòng nhập tên';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _position,
                decoration: InputDecoration(
                  labelText: 'Vị trí',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.95),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'vui lòng nhập vị trí';
                  }
                  return null;
                },
                onSaved: (value) => _position = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _position,
                decoration: InputDecoration(
                  labelText: 'Nhiệm vụ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.95),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'vui lòng nhập thông tin nhiệm vụ';
                  }
                  return null;
                },
                onSaved: (value) => _position = value!,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 83, 237, 243)),
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 8, 0, 0)),
                  minimumSize: MaterialStateProperty.all(Size(
                      MediaQuery.of(context).size.width / 2.2,
                      40)), // Nút có kích thước 1/2.2 chiều rộng màn hình và cao 40
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Update the employee with the new name and position
                    // ...
                    Navigator.pop(context);
                  }
                },
                child: Text('Lưu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AssignmentScreen extends StatefulWidget {
  final Employee employee;

  AssignmentScreen({required this.employee});

  @override
  _AssignmentScreenState createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _position;

  @override
  void initState() {
    super.initState();
    _name = widget.employee.name;
    _position = widget.employee.position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giao công việc nhân viên'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                  labelText: 'Tên nhân viên',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.95),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'vui lòng nhập tên';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _position,
                decoration: InputDecoration(
                  labelText: 'Vị trí',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.95),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'vui lòng nhập vị trí';
                  }
                  return null;
                },
                onSaved: (value) => _position = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _position,
                decoration: InputDecoration(
                  labelText: 'Nhiệm vụ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.95),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'vui lòng nhập thông tin nhiệm vụ';
                  }
                  return null;
                },
                onSaved: (value) => _position = value!,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 83, 237, 243)),
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 8, 0, 0)),
                  minimumSize: MaterialStateProperty.all(Size(
                      MediaQuery.of(context).size.width / 2.2,
                      40)), // Nút có kích thước 1/2.2 chiều rộng màn hình và cao 40
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Update the employee with the new name and position
                    Navigator.pop(context);
                  }
                },
                child: Text('Gửi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewEmployeeScreen extends StatelessWidget {
  final Employee employee;

  ViewEmployeeScreen({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(employee.name, style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 16),
            Text(employee.position,
                style: Theme.of(context).textTheme.subtitle1),
            SizedBox(height: 16),
            Text('Assigned Tasks:',
                style: Theme.of(context).textTheme.subtitle1),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: employee.tasks.length,
                itemBuilder: (context, index) {
                  final task = employee.tasks[index];
                  return ListTile(
                    title: Text(task.name),
                    subtitle: Text(task.description),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
