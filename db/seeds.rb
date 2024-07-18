ArtistPerformance.destroy_all
Performance.destroy_all
Show.destroy_all
Artist.destroy_all
Venue.destroy_all

musicRoom = Venue.create(
  name:        '23 Music Room',
  url_location:'https://maps.app.goo.gl/BLBUc619j6ydwnNG9',
  city:        'Taipei',
  country:     'Taiwan'
)

sillaTurca = Artist.create(
  name:        'Silla Turca',
  image_url:   'https://drive.google.com/file/d/1RYHhMYcxfrMlofpwVyVDVT0huALpdBNK/view?usp=sharing',
  bio:         'I like to use sound recording’s as the main object in the composition, and add on top some noise, using different synths.',
  music_links: ['https://soundcloud.com/sillaturca']
)

third_8 = Show.create(
  title:              'The Third Other 8',
  event_date:          Time.new(2023, 7, 30, 19, 0, 0, "+08:00"),
  description:        'the 8th session of Improvisors improvising another evening of the unexpectedly unexpected! ',
  url_flyer:          'https://drive.google.com/file/d/1dWkFNCk95fx7FDLfOlj94Ue15HyCEunO/view?usp=sharing',
  show_recording_link:'https://thethirdother.bandcamp.com/album/the-third-other-8',
  venue_id:            musicRoom.id
)
noSpicy= Performance.create(
  description:     'live performance at the event "The Third Other" 8 in Taipei City.',
  url_picture_show:'https://drive.google.com/file/d/1nfYrG-QJABvQD1hnx81A9M7v4edUtNGG/view?usp=sharing',
  show_id:         third_8.id
)
ArtistPerformance.create(
  artist_id:sillaTurca.id,
  performance_id:noSpicy.id
  )
