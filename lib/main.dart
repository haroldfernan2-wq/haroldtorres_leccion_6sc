// Importa la librería principal de diseño Material de Flutter para usar widgets visuales
import 'package:flutter/material.dart';

// Función principal que arranca la aplicación ejecutando el widget raíz MaterialApp
void main() {
  print('Iniciando la aplicación de registro de Empresa XYZ...');
  runApp(const EmpresaXyzApp());
}

// Widget raíz inmutable que configura el tema general y la pantalla inicial de la app
class EmpresaXyzApp extends StatelessWidget {
  const EmpresaXyzApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('Construyendo el widget MaterialApp (EmpresaXyzApp)');
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la cinta de modo debug en la esquina superior
      title: 'Empresa XYZ · Registro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E6B3A)),
        useMaterial3: true,
      ),
      home: const RegistroEmpleadoScreen(), // Pantalla principal del formulario de registro
    );
  }
}

// Declaración de un StatefulWidget porque la interfaz se actualizará al pulsar "Mostrar datos"
class RegistroEmpleadoScreen extends StatefulWidget {
  const RegistroEmpleadoScreen({super.key});

  @override
  State<RegistroEmpleadoScreen> createState() => _RegistroEmpleadoScreenState();
}

// Clase de estado que administra los controladores de texto y el resultado mostrado en pantalla
class _RegistroEmpleadoScreenState extends State<RegistroEmpleadoScreen> {
  // Controladores para capturar y leer el texto de cada uno de los 4 campos solicitados
  final TextEditingController ctrlNombre = TextEditingController();
  final TextEditingController ctrlDireccion = TextEditingController();
  final TextEditingController ctrlFecha = TextEditingController();
  final TextEditingController ctrlCargo = TextEditingController();

  // Variable que almacena el texto formateado de los datos ingresados tras presionar el botón
  String datos = '';

  // Libera la memoria de los controladores cuando el widget se destruye (buena práctica en Flutter)
  @override
  void dispose() {
    ctrlNombre.dispose();
    ctrlDireccion.dispose();
    ctrlFecha.dispose();
    ctrlCargo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Construyendo la vista del formulario en _RegistroEmpleadoScreenState');

    // Color verde institucional acorde a la pantalla de referencia del PDF
    const Color verdeInstitucional = Color(0xFF1E6B3A);
    const Color verdeClaroFondo = Color(0xFFEAF5EE);

    // Scaffold proporciona la estructura base de la pantalla (barra superior y cuerpo)
    return Scaffold(
      // Barra superior con el título solicitado en la guía ("Empresa XYZ · Registro")
      appBar: AppBar(
        title: const Text('Empresa XYZ · Registro'),
        backgroundColor: verdeInstitucional,
        foregroundColor: Colors.white,
      ),
      // SingleChildScrollView evita desbordamientos verticales cuando aparece el teclado en el emulador
      body: SingleChildScrollView(
        // Padding añade un margen exterior uniforme alrededor del contenido
        padding: const EdgeInsets.all(16.0),
        // Column organiza verticalmente las etiquetas, campos de texto, botón y área de resultado
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Campo: Nombres completos
            const Text(
              'Nombres completos',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: ctrlNombre,
              decoration: InputDecoration(
                hintText: 'Ej.: Harold Fernando Torres Del Pezo',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
            const SizedBox(height: 14),

            // 2. Campo: Dirección
            const Text(
              'Dirección',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: ctrlDireccion,
              decoration: InputDecoration(
                hintText: 'Ej.: Calle Bolivia 211 y 5 de Junio',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
            const SizedBox(height: 14),

            // 3. Campo: Fecha de nacimiento (incluye ícono de calendario como en la referencia)
            const Text(
              'Fecha de nacimiento',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: ctrlFecha,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintText: 'dd/mm/aaaa',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                suffixIcon: const Icon(Icons.calendar_today_outlined, size: 20),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
            const SizedBox(height: 14),

            // 4. Campo: Cargo
            const Text(
              'Cargo',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: ctrlCargo,
              decoration: InputDecoration(
                hintText: 'Ej.: Asistente administrativo',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
            const SizedBox(height: 20),

            // Botón "MOSTRAR DATOS" que lee los controladores y refresca la pantalla con setState()
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: verdeInstitucional,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              // Al presionar el botón, leemos lo que escribió el usuario
              onPressed: () {
                setState(() {
                  // refresca la pantalla
                  datos = 'Nombre: ${ctrlNombre.text}\n'
                      + 'Dirección: ${ctrlDireccion.text}\n'
                      + 'Nacimiento: ${ctrlFecha.text}\n'
                      + 'Cargo: ${ctrlCargo.text}';
                });
              },
              child: const Text(
                'MOSTRAR DATOS',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 0.5),
              ),
            ),
            const SizedBox(height: 18),

            // Contenedor inferior: muestra el aviso inicial si aún no se presiona el botón,
            // y la tarjeta con "DATOS REGISTRADOS" una vez que se presiona "MOSTRAR DATOS"
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: datos.isEmpty ? Colors.grey.shade50 : verdeClaroFondo,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: datos.isEmpty ? Colors.grey.shade300 : verdeInstitucional,
                ),
              ),
              child: datos.isEmpty
                  ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Aquí se mostrarán los datos\nal presionar el botón',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                  ),
                ),
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado del bloque de resultados mostrado tras pulsar el botón
                  const Text(
                    'DATOS REGISTRADOS',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: verdeInstitucional,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Muestra los datos ingresados por el usuario
                  Text(
                    datos,
                    style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}