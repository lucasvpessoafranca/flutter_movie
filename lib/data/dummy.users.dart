import 'package:flutter_application_1/models/user.dart';

const DUMMY_USERS = {
  "1": User(
    id: '1',
    title: "Velozes e furiosos",
    avatarUrl:
        'https://cdn.pixabay.com/photo/2020/06/17/05/52/car-5308278_1280.jpg',
    description: "A Franquia velozes e furiosos está de volta!",
    duration: '180',
    genero: 'Ação',
    ano: "2023",
    faixaEtaria: "18",
    nota: "5",
  ),
  "2": User(
      id: '2',
      duration: "140",
      title: "Super Mario Bros",
      avatarUrl:
          'https://cdn.pixabay.com/photo/2016/07/30/14/25/mario-1557240_1280.jpg',
      description: "A Franquia Super Mario Bros está de volta!",
      genero: 'Ação',
      ano: "2023",
      faixaEtaria: "18",
      nota: "5"),
  "3": User(
      id: '3',
      duration: "120",
      title: "Barbie ",
      avatarUrl:
          'https://cdn.pixabay.com/photo/2016/08/12/23/24/violin-1589983_1280.jpg',
      description: "A Barbie está de volta!",
      genero: 'Aventura',
      ano: "2023",
      faixaEtaria: "5",
      nota: "4"),
};
