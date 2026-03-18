# IAMoviles-UII-Act-2-Tarjetas-en-columnas
<img width="288" height="483" alt="image" src="https://github.com/user-attachments/assets/12064244-ecd2-4a81-a80a-aaa24cc9d777" />
<img width="1249" height="557" alt="image" src="https://github.com/user-attachments/assets/e1e6b3cc-f5c3-4ee6-b7f7-3fc7e5a305cd" />

PROMPT:

🌸 Documentación de Desarrollo: Florería Ajolote 🌸
Este documento detalla el paso a paso de la creación de la interfaz en Flutter, diseñada específicamente para ser visualizada en DartPad y conectada a recursos externos de GitHub.

1. Configuración de la Estructura Base (Material App)
El primer paso consistió en definir la cáscara de la aplicación.

ThemeData: Se utilizó useMaterial3: true para obtener componentes modernos. Se asignó colorSchemeSeed: Colors.pinkAccent, lo que permite que todos los botones y detalles del sistema adopten una tonalidad rosada coherente de forma automática.

Scaffold: Se estableció un fondo Color(0xFFFFF0F5) (Lavender Blush) para romper con el blanco frío y dar esa sensación "pastel" y suave desde el inicio.

2. Diseño del AppBar y Menú Hamburguesa
Para la navegación conceptual:

AppBar: Se centró el título y se añadieron emojis (🌸) para reforzar la identidad de marca. Se aplicó una elevación (elevation: 4) para dar una ligera sombra sobre el contenido.

Drawer (Menú): Se implementó la propiedad drawer.

Header: Se incluyó un DrawerHeader con el icono local_florist.

Opciones: Se crearon 4 ListTile (Inicio, Productos, Favoritos, Nosotros) con iconos rosados. Aunque no realizan acciones, el menú es completamente funcional al tacto.

3. Implementación de la Lógica de Datos (Modelado)
En lugar de escribir cada tarjeta manualmente, se creó una Lista de Mapas (List<Map<String, String>>):

Se registraron los 5 elementos requeridos (Ajolote flor, logo, cuidado, jazmines y macetas).

Cada elemento contiene su titulo, subtitulo y la url directa del repositorio de GitHub para asegurar que las imágenes carguen correctamente en DartPad.

4. Construcción de la Tarjeta Personalizada (CustomCard)
Este es el componente visual más importante. Se diseñó desde cero usando un Container:

Bordes: Se aplicó un borderRadius de 25.0 para dar un aspecto moderno y orgánico (estilo burbuja).

Sombra (BoxShadow): Se utilizó un color rosa con opacidad baja (Colors.pink.withOpacity(0.15)) para que la tarjeta parezca "flotar" suavemente sobre el fondo pastel.

Distribución: Se usó un widget Row para colocar la imagen a la izquierda y los textos a la derecha.

5. Manejo de Imágenes y Textos
ClipRRect: Se envolvió la imagen en este widget para que las esquinas de la foto coincidan con la curvatura de la tarjeta.

Image.network: Se configuró el fit: BoxFit.cover para que las imágenes no se deformen.

Jerarquía de Texto: * Título: Color rosa fuerte (#C2185B) y negrita.

Subtítulo: Color gris suave y tamaño de fuente menor para crear contraste visual.

6. Renderizado Dinámico
Finalmente, se utilizó un ListView.builder. Esto es una buena práctica porque:

Permite que la aplicación sea eficiente en memoria.

Genera automáticamente las 5 tarjetas (o más) recorriendo la lista de datos definida en el paso 3.
