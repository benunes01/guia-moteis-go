import 'package:flutter/material.dart';

const Map<String, IconData> itemIcons = {
  "ducha dupla": Icons.shower,
  "TV a cabo": Icons.connected_tv_outlined,
  "TV LED 32''": Icons.cable,
  "iluminação por leds": Icons.lightbulb,
  "garagem coletiva": Icons.local_parking,
  "som AM/FM": Icons.radio,
  "3 canais eróticos": Icons.explicit,
  "bluetooth": Icons.bluetooth,
  "espelho no teto": Icons.bed,
  "acesso à suíte via escadas": Icons.stairs,
  "frigobar": Icons.kitchen,
  "ar-condicionado split": Icons.ac_unit,
  "WI-FI": Icons.wifi,
  "secador de cabelo": Icons.waves,
  "smart TV 42\"": Icons.connected_tv_outlined,
  "globo de luz": Icons.lightbulb,
  "ambiente erótico": Icons.favorite,
  "X erótico": Icons.explicit,
  "pole dance": Icons.sports_gymnastics,
  "banheira de hidromassagem": Icons.bathtub,
  "teto solar": Icons.roofing,
  "hidro spa": Icons.spa,
  "piscina aquecida": Icons.pool,
  "garagem privativa": Icons.garage,
  "TV Smart com NetFlix": Icons.smart_display,
  "automaçāo via tablet": Icons.tablet_mac,
  "Alexa": Icons.speaker,
  "vitrine erótica": Icons.visibility,
  "jogo de dados eróticos": Icons.casino,
  "algemas na cama": Icons.lock,
  "acessórios eróticos": Icons.favorite,
};

IconData getItemIcon(String itemName) {
  return itemIcons[itemName] ?? Icons.help_outline;
}
