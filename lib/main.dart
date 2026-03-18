import 'package:flutter/material.dart';

void main() {
  runApp(const FloreriaAjoloteApp());
}

class FloreriaAjoloteApp extends StatelessWidget {
  const FloreriaAjoloteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pinkAccent,
      ),
      home: const CatalogoFloreria(),
    );
  }
}

class CatalogoFloreria extends StatelessWidget {
  const CatalogoFloreria({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de datos para las 5 tarjetas
    final List<Map<String, String>> items = [
      {
        'titulo': 'Ajolote Floral',
        'subtitulo': 'Nuestra mascota oficial',
        'url': 'https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/refs/heads/main/ajoloteflor.PNG'
      },
      {
        'titulo': 'Logo Oficial',
        'subtitulo': 'Florería Ajolote',
        'url': 'https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/refs/heads/main/ajolotelogo.png'
      },
      {
        'titulo': 'Guía de Cuidados',
        'subtitulo': 'Tips para tus plantas',
        'url': 'https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/refs/heads/main/cuidado.png'
      },
      {
        'titulo': 'Jazmines',
        'subtitulo': 'Fragancia y frescura',
        'url': 'https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/refs/heads/main/jasmineflower.png'
      },
      {
        'titulo': 'Macetas',
        'subtitulo': 'Colección artesanal',
        'url': 'https://raw.githubusercontent.com/KevinCardiel1/imagenes-para-flutter-6I-11-FEB-2026/refs/heads/main/macetas.png'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F5), // Fondo rosa pastel suave
      
      // --- MENU HAMBURGUESA (BASE CONCEPTUAL) ---
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFFFF0F5),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.pink[100]),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_florist, size: 50, color: Colors.white),
                    SizedBox(height: 10),
                    Text('Menú Florería', 
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const ListTile(leading: Icon(Icons.home, color: Colors.pink), title: Text('Inicio')),
              const ListTile(leading: Icon(Icons.shopping_bag, color: Colors.pink), title: Text('Productos')),
              const ListTile(leading: Icon(Icons.favorite, color: Colors.pink), title: Text('Favoritos')),
              const ListTile(leading: Icon(Icons.info, color: Colors.pink), title: Text('Sobre Nosotros')),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        title: const Text('🌸 Florería Ajolote 🌸', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
        elevation: 4,
        // El icono de hamburguesa aparecerá automáticamente aquí gracias al 'drawer'
      ),
      
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomCard(
            title: items[index]['titulo']!,
            subtitle: items[index]['subtitulo']!,
            imageUrl: items[index]['url']!,
          );
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withAlpha(38),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 90, height: 90, color: Colors.pink[50],
                  child: const Icon(Icons.image_not_supported, color: Colors.pink),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC2185B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
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