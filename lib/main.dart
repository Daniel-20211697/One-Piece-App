//Daniel Baez 2021-1697
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(OnePieceApp());
}

class OnePieceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Piece App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One Piece'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Portada con un video GIF
            Image.asset(
              'assets/portada.gif', 
              fit: BoxFit.cover,
            ),
            // Personajes
            ListTile(
              title: Text('Personajes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaPersonajes()),
                );
              },
            ),
            // Momentos
            ListTile(
              title: Text('Momentos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaMomentos()),
                );
              },
            ),
            // Acerca De
            ListTile(
              title: Text('Acerca De'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaSobre()),
                );
              },
            ),
            // En mi vida con un video
            ListTile(
              title: Text('En mi vida'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MiVidaPage()),
                );
              },
            ),
            // Contrátame 
            ListTile(
              title: Text('Contrátame'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContratamePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaginaPersonajes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personajes'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElementoPersonaje(
            nombre: 'Monkey D. Luffy',
            imagen: 'assets/luffy.jpg',
            descripcion:
                'Monkey D. Luffy es el protagonista principal de la serie de manga y anime One Piece, creada por Eiichiro Oda. Es un joven pirata que sueña con encontrar el legendario tesoro One Piece y convertirse en el Rey de los Piratas.',
          ),
          ElementoPersonaje(
            nombre: 'Roronoa Zoro',
            imagen: 'assets/zoro.jpg',
            descripcion:
                'Roronoa Zoro es reconocido por su habilidad en el combate con espadas, utilizando un estilo de lucha de tres espadas conocido como Santoryu. Siempre lleva consigo tres espadas, una en cada mano y otra en la boca. Además de su destreza en el combate, Zoro también es conocido por su determinación, su lealtad hacia sus amigos y su sentido del honor.',
          ),
          ElementoPersonaje(
            nombre: 'Vinsmoke Sanji ',
            imagen: 'assets/sanji.jpg',
            descripcion:
                'Sanji es un talentoso cocinero y combatiente que se especializa en el estilo de lucha conocido como "Black Leg" (Pierna Negra). Es reconocido por su habilidad para pelear usando principalmente sus piernas, las cuales son extremadamente poderosas y rápidas. Sanji se niega a usar sus manos en el combate, ya que las considera sagradas debido a su habilidad culinaria.',
          ),
        ],
      ),
    );
  }
}

class ElementoPersonaje extends StatelessWidget {
  final String nombre;
  final String imagen;
  final String descripcion;

  const ElementoPersonaje({
    required this.nombre,
    required this.imagen,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(nombre),
                  content: SingleChildScrollView( // Envolver el contenido en SingleChildScrollView
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(imagen),
                        SizedBox(height: 10),
                        Text(
                          descripcion,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    imagen,
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      nombre,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}

class PaginaMomentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Momentos'),
      ),
      body: ListView(
        children: [
          ItemMomento(
            titulo: 'Arco de Enies Lobby',
            imagen: 'assets/enies_lobby.jpg',
            detalles:
                'En este arco, los Piratas del Sombrero de Paja se dirigen a Enies Lobby, la sede del Gobierno Mundial, con el objetivo de rescatar a su compañera Robin, quien fue capturada por la organización Cipher Pol. Luffy y sus amigos se enfrentan a numerosos enemigos y superan obstáculos para llegar a Robin. Finalmente, se desencadena una épica batalla en Enies Lobby, donde los Piratas del Sombrero de Paja luchan contra los agentes del Gobierno Mundial, incluyendo a los poderosos CP9. Con la ayuda de sus aliados, Luffy logra derrotar a sus oponentes y rescatar a Robin. Después de la batalla, los Piratas del Sombrero de Paja huyen de Enies Lobby mientras la Buster Call, un ataque devastador del Gobierno Mundial, destruye la isla.',
            rutaVideo: 'assets/enies_lobby_video.mp4',
          ),
          ItemMomento(
            titulo: 'Arco de Marineford',
            imagen: 'assets/marineford.jpg',
            detalles:
                'En este arco, se desarrolla una guerra a gran escala en Marineford, la base principal de la Marina. Luffy y sus aliados se dirigen a Marineford para rescatar a Ace, el hermano de Luffy, quien ha sido capturado por los Marines y está condenado a ser ejecutado. Durante la guerra, Luffy y sus compañeros se enfrentan a poderosos adversarios, incluyendo a los Almirantes y al líder de la Marina, el almirante Akainu. A pesar de sus esfuerzos, Ace muere protegiendo a Luffy de un ataque y la guerra concluye con la intervención de Barba Blanca, uno de los Yonko. La muerte de Ace tiene un impacto profundo en Luffy y marca un punto de inflexión en la historia de One Piece.',
            rutaVideo: 'assets/marineford_video.mp4',
          ),
          ItemMomento(
            titulo: 'Arco de Dressrosa',
            imagen: 'assets/dressrosa.jpg',
            detalles:
                'En este arco, los Piratas del Sombrero de Paja llegan a Dressrosa, una isla gobernada por el Shichibukai Donquixote Doflamingo. Luffy y sus amigos se involucran en una conspiración que involucra a Doflamingo y su control sobre la isla. Luffy se enfrenta a Doflamingo y sus subordinados mientras busca derrocar su régimen opresivo y liberar a la gente de Dressrosa. Durante la batalla, se revelan secretos oscuros sobre la historia de Doflamingo y su conexión con los Celestiales Dragones. Además, otros personajes importantes, como Trafalgar Law y los Coliseo Corrida, también tienen un papel crucial en este arco. Al final, Luffy y sus aliados logran derrotar a Doflamingo y liberar a Dressrosa.',
            rutaVideo: 'assets/dressrosa_video.mp4',
          ),
        ],
      ),
    );
  }
}

class ItemMomento extends StatelessWidget {
  final String titulo;
  final String imagen;
  final String detalles;
  final String rutaVideo;

  const ItemMomento({
    required this.titulo,
    required this.imagen,
    required this.detalles,
    required this.rutaVideo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(titulo),
              content: Container(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(imagen),
                      SizedBox(height: 10),
                      Text(
                        detalles,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      // Reproductor de video
                      ReproductorVideo(rutaVideo: rutaVideo),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                imagen,
                width: 100,
                height: 100,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  titulo,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'One Piece es un manga y anime creado por Eiichiro Oda.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Creador:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Container(
                height: 200, // Altura de la imagen
                child: AspectRatio(
                  aspectRatio: 16 / 9, // Proporción de aspecto 
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/eiichiro_oda.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Cantidad de temporadas:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _crearTextoTemporada('Temporada 1: East Blue'),
                  _crearTextoTemporada('Temporada 2: Alabasta'),
                  _crearTextoTemporada('Temporada 3: Skypiea'),
                  _crearTextoTemporada('Temporada 4: Water 7'),
                  _crearTextoTemporada('Temporada 5: Thriller Bark'),
                  _crearTextoTemporada('Temporada 6: Guerra de Marineford'),
                  _crearTextoTemporada('Temporada 7: Devuelta a Archipelago Sabaody'),
                  _crearTextoTemporada('Temporada 8: Isla Gyojin'),
                  _crearTextoTemporada('Temporada 9: Punk Hazard'),
                  _crearTextoTemporada('Temporada 10: Dressrosa'),
                  _crearTextoTemporada('Temporada 11: Zou'),
                  _crearTextoTemporada('Temporada 12: Whole Cake Island'),
                  _crearTextoTemporada('Temporada 13: País de Wano'),
                  _crearTextoTemporada('Temporada 14: EggHead'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Información adicional:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'One Piece sigue las aventuras de Monkey D. Luffy y su tripulación, mientras buscan el legendario tesoro One Piece para convertirse en el Rey de los Piratas. La serie está llena de emocionantes batallas, personajes memorables y una historia épica que ha cautivado a fans de todo el mundo.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearTextoTemporada(String texto) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(texto),
    );
  }
}

class MiVidaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('En mi vida'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '¿Qué significa One Piece en mi vida?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          ReproductorVideo(rutaVideo: 'assets/mi_vida.mp4'),
        ],
      ),
    );
  }
}



class ContratamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contrátame'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Texto "¡Contrátame!" más grande y en negrita
            Text(
              '¡Contrátame!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Foto más grande y centrada
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Borde redondeado
                image: DecorationImage(
                  image: AssetImage('assets/daniel.png'),
                  fit: BoxFit.cover, // Ajuste para adaptarse a la resolución original
                ),
              ),
            ),
            SizedBox(height: 20),
            // Nombre 
            Text(
              'Daniel Baez',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            // Información adicional 
            Text(
              'Para una aplicación como esta, me puedes contactar al...',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            // Número de teléfono 
            Text(
              'Teléfono: +1234567890',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            // Correo electrónico 
            Text(
              'Correo Electrónico: 20211697@itla.edu.do',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}




class ReproductorVideo extends StatefulWidget {
  final String rutaVideo;

  ReproductorVideo({required this.rutaVideo});

  @override
  _ReproductorVideoState createState() => _ReproductorVideoState();
}

class _ReproductorVideoState extends State<ReproductorVideo> {
  late VideoPlayerController _controlador;
  bool _estaReproduciendo = false;

  @override
  void initState() {
    super.initState();
    _controlador = VideoPlayerController.asset(widget.rutaVideo)
      ..initialize().then((_) {
        setState(() {});
        _controlador.addListener(() {
          if (_controlador.value.isPlaying && !_estaReproduciendo) {
            setState(() {
              _estaReproduciendo = true;
            });
          } else if (!_controlador.value.isPlaying && _estaReproduciendo) {
            setState(() {
              _estaReproduciendo = false;
            });
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_controlador.value.isPlaying) {
            _controlador.pause();
            _estaReproduciendo = false;
          } else {
            _controlador.play();
            _estaReproduciendo = true;
          }
        });
      },
      child: _controlador.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controlador.value.aspectRatio,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_controlador),
                  _estaReproduciendo ? SizedBox() : Icon(Icons.play_arrow, size: 50),
                ],
              ),
            )
          : CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controlador.dispose();
  }
}
