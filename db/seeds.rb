challenges = [
  {
    name: 'Mimic a Cat',
    description: 'Mimic a cat and sound like Meaaow!'
  },
  {
    name: 'Singing',
    description: 'Sing a song in you melodious voice.'
  },
  {
    name: 'Tongue Twister',
    description: 'Peter Piper picked a peck of pickled peppers'
  },
  {
    name: 'Poetry',
    description: 'Recite a piece from your favorite poet.'
  },
  {
    name: 'Truth',
    description: 'Tell us a truth you never told anyone!'
  },
  {
    name: 'Dare',
    description: 'We dare you to eat a chilli in front of camera'
  }
]

Challenge.create(challenges)

PASSWORD = 'DESI-DEV'.freeze
companies = [
  {
    name: 'InvoZone',
    email: 'hr@invozone.com',
    password: PASSWORD,
    password_confirmation: PASSWORD
  },
  {
    name: 'Tiksom Pvt. Ld.',
    email: 'hr@tiksom.com',
    password: PASSWORD,
    password_confirmation: PASSWORD
  },
  {
    name: 'Sunduso',
    email: 'hr@sunduso.com',
    password: PASSWORD,
    password_confirmation: PASSWORD
  },
  {
    name: 'Devsinc Pvt. Ltd.',
    email: 'hr@devsinc.com',
    password: PASSWORD,
    password_confirmation: PASSWORD
  },
  {
    name: 'Microsoft',
    email: 'hr@microsoft.com',
    password: PASSWORD,
    password_confirmation: PASSWORD
  },
  {
    name: 'Google',
    email: 'hr@google.com',
    password: PASSWORD,
    password_confirmation: PASSWORD
  },
  {
    name: 'Facebook',
    email: 'hr@facebook.com',
    password: PASSWORD,
    password_confirmation: PASSWORD
  },
  {
    name: 'Amazon',
    email: 'hr@amazon.com',
    password: PASSWORD,
    password_confirmation: PASSWORD
  }
]

Company.create(companies)

DESIGNATIONS = ['Software Engineer', 'Business Developer', 'Graphic Designer',
                'Content Writer', 'Game Developer', 'Product Manager'].freeze

Company.all.each do |company|
  employees = [
    {
      name: 'Sajjad Umar',
      designation: 'Senior Software Engineer',
      email: 'sajjadumardev@gmail.com',
      password: PASSWORD,
      password_confirmation: PASSWORD
    },
    {
      name: 'Alex Brown',
      designation: DESIGNATIONS.sample(1).first,
      email: "alex@#{company.name}.com",
      password: PASSWORD,
      password_confirmation: PASSWORD
    },
    {
      name: 'Muhammad hamza',
      designation: DESIGNATIONS.sample(1).first,
      email: "mhamza@#{company.name}.com",
      password: PASSWORD,
      password_confirmation: PASSWORD
    },
    {
      name: 'Muhammad Tayyab',
      designation: DESIGNATIONS.sample(1).first,
      email: "mt@#{company.name}.com",
      password: PASSWORD,
      password_confirmation: PASSWORD
    },
    {
      name: 'Gorge Buttler',
      designation: DESIGNATIONS.sample(1).first,
      email: "gb@#{company.name}.com",
      password: PASSWORD,
      password_confirmation: PASSWORD
    },
    {
      name: 'Alina Simons',
      designation: DESIGNATIONS.sample(1).first,
      email: "simons@#{company.name}.com",
      password: PASSWORD,
      password_confirmation: PASSWORD
    }
  ]
  company.employees.create(employees)
end
