country = Spree::Country.find_by(name: 'Cuba')

Spree::State.create!([
  { name: 'Pinar del Río', abbr: 'PRI', country: country },
  { name: 'Artemisa', abbr: 'ART', country: country },
  { name: 'Mayabeque', abbr: 'MAY', country: country },
  { name: 'La Habana', abbr: 'HAB', country: country },
  { name: 'Matanzas', abbr: 'MTZ', country: country },
  { name: 'Villa Clara', abbr: 'VCL', country: country },
  { name: 'Cienfuegos', abbr: 'CFG', country: country },
  { name: 'Santi Spiritus', abbr: 'STP', country: country },
  { name: 'Ciego de Ávila', abbr: 'CAV', country: country },
  { name: 'Camaguey', abbr: 'CAM', country: country },
  { name: 'Las Tunas', abbr: 'TUN', country: country },
  { name: 'Holguín', abbr: 'HOL', country: country },
  { name: 'Granma', abbr: 'GNM', country: country },
  { name: 'Santiago de Cuba', abbr: 'SCB', country: country },
  { name: 'Guantánamo', abbr: 'GTM', country: country },
  { name: 'Isla de la Juventud', abbr: 'ISJ', country: country }
  ])
