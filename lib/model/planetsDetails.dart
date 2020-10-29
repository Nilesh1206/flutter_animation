import 'package:TestApp/model/planetDetail.dart';
import 'package:TestApp/model/planetDetail.dart';
class PlanetDao {

  static final List<Planet> planets = [
    const Planet(
      id: "1",
      name: "Mars",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/mars.png",
      backImage: 'https://i.gifer.com/hFK.gif',
    ),
    const Planet(
      id: "2",
      name: "Neptune",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.111 m/s ",
      description: "Lorem ipsum...",
      image: "assets/neptune.png",
      backImage: 'https://64.media.tumblr.com/3684a3a641af570b01ea32c587227c6f/tumblr_inline_ovepoaLiJI1tzhl5u_500.gifv',
    ),
    const Planet(
      id: "3",
      name: "Moon",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.811 m/s ",
      description: "Lorem ipsum...",
      image: "assets/moon.png",
      backImage: 'https://i.imgur.com/2UJWhG5.gif',
    ),
    const Planet(
      id: "4",
      name: "Earth",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/earth.png",
      backImage: 'http://bestanimations.com/Earth&Space/Earth/earth2/large-earth-flyover-animated-gif-2.gif'
    ),
    const Planet(
      id: "5",
      name: "Mercury",
      location: "Milkyway Galaxy",
      distance: "54.6m Km",
      gravity: "3.711 m/s ",
      description: "Lorem ipsum...",
      image: "assets/mercury.png",
      backImage: 'https://i.gifer.com/FQrg.gif'
    ),
  ];

  static Planet getPlanetById(id) {
    return planets
        .where((p) => p.id == id)
        .first;
  }
}