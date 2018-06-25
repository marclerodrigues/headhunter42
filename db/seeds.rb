
User.create(first_name: 'Admin',
            last_name: 'Headhunter',
            role: 'admin',
            email: ENV['ADMIN_EMAIL'],
            password: ENV['ADMIN_PASSWORD'])

Company.create()

devback = Pipeline.create(name: 'Developer FullStack')

s1 = Step.create(
  name: 'Coding backend',
  description: 'Zssn API Restfull',
  pipeline_id: devback.id,
  order: 1)

s2 = Step.create(
  name: 'Coding frontend',
  description: 'Zssn front',
  order: 2,
  pipeline_id: devback.id)

s3 = Step.create(
  name: 'Face-to-face',
  description: 'Enterview and english',
  pipeline_id: devback.id,
  order: 3)

s4 = Step.create(
  name: 'Hired',
  description: 'Congrats you are hired',
  pipeline_id: devback.id,
  order: 4)
