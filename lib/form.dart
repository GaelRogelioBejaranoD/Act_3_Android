import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Cambiaremos cada controlador para que maneje su campo individualmente
  final _idController = TextEditingController();           // ID Entrenador
  final _nameController = TextEditingController();         // Nombre Entrenador
  final _specialtyController = TextEditingController();    // Especialidad
  final _phoneController = TextEditingController();       // Teléfono
  final _emailController = TextEditingController();       // Correo
  final _statusController = TextEditingController();      // Estado
  final _scheduleController = TextEditingController();    // Horario

  @override
  void dispose() {
    // Asegúrate de liberar todos los controladores al final
    _idController.dispose();
    _nameController.dispose();
    _specialtyController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _statusController.dispose();
    _scheduleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 199, 230, 255),
            title: const Text("Act 3 Bejarano"),
            centerTitle: true),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              MyTextField(
                  myController: _idController,            // ID Entrenador
                  fieldName: "ID entrenador",
                  myIcon: Icons.account_balance,
                  prefixIconColor: const Color.fromARGB(255, 102, 161, 201)),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _nameController,          // Nombre Entrenador
                  fieldName: "Nombre entrenador",
                  myIcon: Icons.account_circle,
                  prefixIconColor: const Color.fromARGB(255, 102, 161, 201)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _specialtyController,     // Especialidad
                  fieldName: "Especialidad",
                  myIcon: Icons.star,
                  prefixIconColor: const Color.fromARGB(255, 102, 161, 201)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _phoneController,         // Teléfono
                  fieldName: "Teléfono",
                  myIcon: Icons.phone,
                  prefixIconColor: const Color.fromARGB(255, 102, 161, 201)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _emailController,         // Correo
                  fieldName: "Correo",
                  myIcon: Icons.email,
                  prefixIconColor: const Color.fromARGB(255, 102, 161, 201)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _statusController,        // Estado
                  fieldName: "Estado",
                  myIcon: Icons.check_circle,
                  prefixIconColor: const Color.fromARGB(255, 102, 161, 201)),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _scheduleController,      // Horario
                  fieldName: "Horario",
                  myIcon: Icons.access_time,
                  prefixIconColor: const Color.fromARGB(255, 102, 161, 201)),
              const SizedBox(height: 20.0),
              myBtn(context),
            ],
          ),
        ));
  }

  // Function that returns OutlinedButton Widget and passes data to Details Screen
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              productName: _nameController.text,          // Enviar Nombre Entrenador
              productDescription: _specialtyController.text, // Enviar Especialidad
            );
          }),
        );
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.deepPurple),
      ),
    );
  }
}

// Custom Stateless Widget Class for reusable TextField
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });
  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade300),
          ),
          labelStyle: const TextStyle(color: Colors.deepPurple)),
    );
  }
}